import 'package:contact_app/core/config/api_routes.dart';
import 'package:contact_app/core/config/enums.dart';
import 'package:contact_app/core/config/http_service.dart';
import 'package:contact_app/core/config/main_controller.dart';
import 'package:contact_app/features/contact/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends MainController {
  Rx<TextEditingController> searchController = TextEditingController().obs;

  late List<Contact> contacts = [];

  Future<void> getContacts() async {
    state.value = PageState.loading;
    var response = await HttpService.get(ApiRoutes.contacts);
    contacts.addAll(
      List.from((response as List).map((e) => Contact.fromJson(e)).toList()),
    );
    update();
    state.value = PageState.loaded;
  }
}
