import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contact_app/core/config/images.dart';
import 'package:contact_app/core/config/strings.dart';
import 'package:contact_app/core/widgets/image_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatelessWidget {
  final dynamic image;
  final double borderRadius;
  final bool shrinkWrap;
  final bool hasFullScreenMode;
  const ImageWidget({
    Key? key,
    required this.image,
    this.borderRadius = 20,
    this.shrinkWrap = false,
    this.hasFullScreenMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Container(
      width: shrinkWrap ? double.infinity : null,
      height: shrinkWrap ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: image != null
            ? image is Widget
                ? image
                : image is File
                    ? FadeInImage(
                        placeholder: const AssetImage(AppImages.loading),
                        image: FileImage(image),
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const ImageErrorWidget();
                        },
                      )
                    : !Uri.parse(image).isAbsolute
                        ? Image.asset(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const ImageErrorWidget();
                            },
                          )
                        : FadeInImage(
                            placeholder: const AssetImage(AppImages.loading),
                            image: CachedNetworkImageProvider(image),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return const ImageErrorWidget();
                            },
                          )
            : Image.asset(
                AppImages.defaultImage,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
