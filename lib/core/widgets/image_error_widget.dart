import 'package:contact_app/core/config/strings.dart';
import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error,size: 12,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            AppStrings.error,
            maxLines: 2,
            style: themeData.textTheme.caption!.copyWith(fontSize: 8),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
