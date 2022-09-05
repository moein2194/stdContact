import 'package:contact_app/core/config/app_routes.dart';
import 'package:contact_app/core/config/enums.dart';
import 'package:contact_app/core/config/main_controller.dart';
import 'package:contact_app/core/models/user/user_model.dart';
import 'package:contact_app/core/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends MainController {
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;

  Rx<TextEditingController> passwordController = TextEditingController().obs;

  Future<void> login() async {
    state.value = PageState.loading;
    UserModel userModel = UserModel(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    await LocalStorage.set(
        key: LocalStorage.keyUser, value: userModel.toJson());

    state.value = PageState.loaded;
    Get.offAndToNamed(AppRoutes.contactListPage);

  }

}
