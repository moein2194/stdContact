import 'package:contact_app/core/config/api_routes.dart';
import 'package:contact_app/core/config/http_service.dart';
import 'package:contact_app/core/config/main_controller.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/features/contact/controllers/contact_list_controller.dart';
import 'package:contact_app/features/contact/models/contact_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SingleContactController extends MainController {
  Contact? _contact;

  RxBool isLoadingRemove = false.obs;

  Contact? get contact => _contact;

  set contact(Contact? contact) {
    _contact = contact;
    update();
  }

  Future<void> onTapRemove() async {
    isLoadingRemove.value = true;
    await removeUser();
    isLoadingRemove.value = false;
    Get.back();
  }

  Future<bool> removeUser() async {
    var response =
        await HttpService.delete("${ApiRoutes.contacts}/${contact!.id}");
    if (response == null || response != true) {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.red,
        message: AppStrings.defaultError,
        duration: Duration(milliseconds: 2000),
      ));
      return false;
    } else {
      removeUserFromList();
      return true;
    }
  }

  void removeUserFromList() {
    Get.put(ContactController())
        .contacts
        .removeWhere((element) => element == contact!);
    Get.put(ContactController()).update();
  }
}
