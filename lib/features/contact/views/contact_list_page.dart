import 'package:contact_app/core/config/app_routes.dart';
import 'package:contact_app/core/config/enums.dart';
import 'package:contact_app/core/config/images.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/core/config/vectors.dart';
import 'package:contact_app/core/widgets/contact_text_field.dart';
import 'package:contact_app/core/widgets/image_widget.dart';
import 'package:contact_app/features/contact/controller/contact_controller.dart';
import 'package:contact_app/features/contact/views/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  static ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, 170),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 32.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      AppStrings.myContact,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: ImageWidget(
                        image: SvgPicture.asset(AppVectors.avatar),
                        borderRadius: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                (() => ContactTextField(
                      controller: controller.searchController.value,
                      margin: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: AppStrings.searchHint,
                    )),
              )
            ],
          ),
        ),
        body: GetBuilder<ContactController>(
          init: controller,
          initState: (state) {
            controller.state.value = PageState.loaded;
            controller.getContacts();
          },
          builder: (c) {
            return Column(
              children: [
                Visibility(
                  visible: controller.state.value == PageState.loading,
                  child: Center(
                    child: SpinKitDancingSquare(
                      color: themeData.primaryColor,
                      size: 45,
                    ),
                  ),
                ),
                c.contacts.isNotEmpty && c.state.value == PageState.loaded
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: c.contacts.length,
                          padding: const EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemBuilder: (context, index) {
                            var contact = c.contacts[index];
                            return ContactCard(
                              name:
                                  "${contact.firstName!} ${contact.lastName!}",
                              image: AppImages.defaultImage,
                              phoneNumber: contact.phone,
                              onTap: () {
                                Get.toNamed(AppRoutes.singleContactPage);
                              },
                            );
                          },
                        ),
                      )
                    : c.contacts.isEmpty && c.state.value == PageState.loaded
                        ? const Center(child: Text(AppStrings.contactsIsEmpty))
                        : const SizedBox(),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
