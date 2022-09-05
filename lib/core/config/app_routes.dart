
import 'package:contact_app/features/contact/views/add_contact_page.dart';
import 'package:contact_app/features/contact/views/contact_list_page.dart';
import 'package:contact_app/features/contact/views/single_contact_page.dart';
import 'package:contact_app/features/login/views/login_page.dart';
import 'package:contact_app/features/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static final List<GetPage> listOfPages = [
    GetPage(name: splashScreenPage, page: () => const SplashScreenPage()),
    GetPage(name: loginPage, page: () => const LoginPage()),
    GetPage(name: contactListPage, page: () => const ContactListPage()),
    GetPage(name: singleContactPage, page: () => const SingleContactPage()),
    GetPage(name: addContactPage, page: () => const AddContactPage()),
  ];

  static const splashScreenPage = "/splash";
  static const loginPage = "/login";
  static const contactListPage = "/contactList";
  static const singleContactPage = "/singleContactPage";
  static const addContactPage = "/editContactPage";
}
