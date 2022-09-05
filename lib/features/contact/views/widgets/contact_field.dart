import 'package:contact_app/core/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ContactField extends StatelessWidget {
  final String title;
  final String? body;
  const ContactField({
    required this.title,
    this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: body));
        Get.showSnackbar(
          const GetSnackBar(
            message: AppStrings.textCopyClipBoard,
            backgroundColor: Colors.black,
            duration: Duration(
              milliseconds: 2000,
            ),
          ),
        );
      },
      
      child: Container(
        width: width,
        color: Colors.black12,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              body ?? "",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
