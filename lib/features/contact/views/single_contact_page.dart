import 'package:contact_app/core/config/app_routes.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/core/config/vectors.dart';
import 'package:contact_app/core/widgets/image_widget.dart';
import 'package:contact_app/features/contact/controllers/single_contact_controller.dart';
import 'package:contact_app/features/contact/views/widgets/contact_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SingleContactPage extends StatelessWidget {
  const SingleContactPage({super.key});

  static SingleContactController controller =
      Get.put(SingleContactController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: appBar(width),
        body: GetBuilder<SingleContactController>(
          init: controller,
          initState: (state) {
            controller.contact = Get.arguments;
          },
          dispose: (state) {
            controller.isLoadingRemove.value = false;
          },
          autoRemove: true,
          builder: (c) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: ImageWidget(
                        image: SvgPicture.asset(AppVectors.avatar),
                        borderRadius: 300,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${controller.contact!.firstName} ${controller.contact!.lastName}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(),
                ContactField(
                  title: AppStrings.phone,
                  body: controller.contact!.phone,
                ),
                const Divider(
                  color: Colors.white,
                  height: 0.5,
                ),
                ContactField(
                  title: AppStrings.email,
                  body: controller.contact!.email,
                ),
                const Divider(
                  color: Colors.white,
                  height: 0.5,
                ),
                ContactField(
                  title: AppStrings.notes,
                  body: controller.contact!.notes,
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            );
          },
        ),
        floatingActionButton: floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }

  Widget floatButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(AppRoutes.addContactPage, arguments: controller.contact);
      },
      child: const Icon(
        Icons.edit,
      ),
    );
  }

  PreferredSizeWidget appBar(double width) {
    return PreferredSize(
      preferredSize: Size(width, 60),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
            Obx(
              (() => TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () async {
                      await controller.onTapRemove();
                    },
                    child: controller.isLoadingRemove.value
                        ? const SpinKitCircle(
                            color: Colors.red,
                            size: 16,
                          )
                        : const Text(
                            AppStrings.remove,
                          ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
