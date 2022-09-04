import 'package:contact_app/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String? image;
  final String? name;
  final String? phoneNumber;
  final VoidCallback? onTap;
  const ContactCard({this.name, this.image, this.phoneNumber,this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
              ),
            ],
            color: Colors.white),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              width: 45,
              height: 45,
              child: ImageWidget(
                image: image,
                borderRadius: 50,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? "",
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    phoneNumber ?? "",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
