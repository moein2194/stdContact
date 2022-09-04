import 'package:contact_app/core/config/app_routes.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/core/storage/local_storage.dart';
import 'package:contact_app/features/contact/views/contact_list_page.dart';
import 'package:contact_app/features/login/pages/login_page.dart';
import 'package:contact_app/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      getPages: AppRoutes.listOfPages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: LocalStorage.get(key: LocalStorage.keyUser),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreenPage();
          }
          if (snapshot.hasData) {
            return const ContactListPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
