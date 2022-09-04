import 'package:contact_app/core/config/enums.dart';
import 'package:contact_app/core/config/images.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/core/widgets/contact_text_field.dart';
import 'package:contact_app/core/widgets/image_widget.dart';
import 'package:contact_app/features/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/errors/text_field_error.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          extendBody: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const SizedBox(
                width: 200,
                child: ImageWidget(image: AppImages.companyLogo),
              ),
              const Spacer(),
              Obx(
                (() => Form(
                      key: controller.formKey.value,
                      child: Column(
                        children: [
                          ContactTextField(
                            labelText: AppStrings.email,
                            helperText: AppStrings.sampleEmail,
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController.value,
                            enabled: controller.state.value == PageState.loaded,
                            validator: (value) => value?.validateEmail(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ContactTextField(
                            labelText: AppStrings.password,
                            helperText: AppStrings.samplePassword,
                            controller: controller.passwordController.value,
                            enabled: controller.state.value == PageState.loaded,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) => value?.validatePassword(),
                          ),
                        ],
                      ),
                    )),
              ),
              const Spacer(),
              SizedBox(
                width: width,
                child: Obx(
                  (() => ElevatedButton(
                        onPressed: () async{
                          if (controller.formKey.value.currentState!
                              .validate()) {
                             await controller.login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        child: controller.state.value == PageState.loading
                            ? const SpinKitCircle(
                                color: Colors.white,
                                size: 20,
                              )
                            : const Text(
                                AppStrings.confirm,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
