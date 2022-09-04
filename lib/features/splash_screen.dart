import 'package:contact_app/core/config/images.dart';
import 'package:contact_app/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                width: 200, child: ImageWidget(image: AppImages.companyLogo)),
            const SizedBox(
              height: 60,
            ),
            SpinKitCircle(
              color: themeData.primaryColor,
              size: 45,
            ),
          ],
        ),
      ),
    );
  }
}
