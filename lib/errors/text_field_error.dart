import 'package:contact_app/core/config/strings.dart';

extension StringExtension on String {
  String? validateEmail() {
    RegExp email = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (length == 0) {
      return AppStrings.enterYourEmail;
    }
    if (!email.hasMatch(this)) {
      return AppStrings.emailError;
    }
  }

  String? validatePhoneNumber() {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (length == 0) {
      return AppStrings.enterPhoneNumber;
    }
    if (length < 8 || !regExp.hasMatch(this)) {
      return AppStrings.phoneError;
    }
  }

  String? validatePassword() {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (length == 0) {
      return "Please enter your password";
    }
    if (length < 8 || !regExp.hasMatch(this)) {
      return "Your password must be at least 8 characters long";
    }
  }
}
