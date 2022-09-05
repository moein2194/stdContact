import 'package:contact_app/core/config/app_globals.dart';
import 'package:contact_app/core/config/app_routes.dart';
import 'package:contact_app/core/config/enums.dart';
import 'package:contact_app/core/config/images.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/core/config/vectors.dart';
import 'package:contact_app/core/widgets/contact_text_field.dart';
import 'package:contact_app/core/widgets/image_widget.dart';
import 'package:contact_app/features/contact/controllers/contact_list_controller.dart';
import 'package:contact_app/features/contact/views/widgets/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  static ContactController controller = Get.put(ContactController());

  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: endDrawerWidget(width),
        appBar: appBar(width),
        body: GetBuilder<ContactController>(
          init: controller,
          initState: (state) {
            controller.state.value = PageState.loaded;

            if (controller.contacts.isEmpty) {
              controller.getContacts();
            }
          },
          builder: (c) {
            return Column(
              children: [
                Visibility(
                  visible: controller.state.value == PageState.loading,
                  child: Center(
                    child: SpinKitCircle(
                      color: themeData.primaryColor,
                      size: 45,
                    ),
                  ),
                ),
                c.contacts.isNotEmpty &&
                        c.state.value == PageState.loaded &&
                        c.searchContacts.isEmpty
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
                                Get.toNamed(AppRoutes.singleContactPage,
                                    arguments: contact);
                              },
                            );
                          },
                        ),
                      )
                    : c.contacts.isEmpty && c.state.value == PageState.loaded
                        ? const Center(child: Text(AppStrings.contactsIsEmpty))
                        : c.searchContacts.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: c.searchContacts.length,
                                  padding: const EdgeInsets.all(0),
                                  physics: const BouncingScrollPhysics(
                                      parent: AlwaysScrollableScrollPhysics()),
                                  itemBuilder: (context, index) {
                                    var contact = c.searchContacts[index];
                                    return ContactCard(
                                      name:
                                          "${contact.firstName!} ${contact.lastName!}",
                                      image: AppImages.defaultImage,
                                      phoneNumber: contact.phone,
                                      onTap: () {
                                        Get.toNamed(AppRoutes.singleContactPage,
                                            arguments: contact);
                                      },
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
              ],
            );
          },
        ),
        floatingActionButton: floatButton(),
      ),
    );
  }

  PreferredSizeWidget appBar(double width) {
    return PreferredSize(
      preferredSize: Size(width, 155),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 32.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.myContact,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: ImageWidget(
                      image: SvgPicture.asset(AppVectors.avatar),
                      borderRadius: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            (() => ContactTextField(
                  controller: controller.searchController.value,
                  onChanged: (value) {
                    controller.searchUser(value);
                  },
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
    );
  }

  Widget floatButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.add,
        size: 35,
        color: Colors.white,
      ),
    );
  }

  Widget endDrawerWidget(double width) {
    return Container(
      width: width * 0.4,
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: ImageWidget(
              image: SvgPicture.asset(AppVectors.avatar),
              borderRadius: 50,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppGlobals.userModel!.email!,
          ),
          const Divider(),
          const Spacer(),
          const Divider(),
          TextButton.icon(
            onPressed: () async {
              await controller.logout();
            },
            label: const Text(AppStrings.logout),
            icon: const Icon(
              Icons.logout_rounded,
            ),
          )
        ],
      ),
    );
  }
}
