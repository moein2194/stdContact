import 'package:flutter/material.dart';

class ContactTextField extends StatelessWidget {
  final Key? key;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final EdgeInsets margin;
  final Widget? prefixIcon;
  final String? helperText;
  final String? labelText;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;
  final int maxLines;
  final void Function(String)? onChanged;
  const ContactTextField({
    this.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.helperText,
    this.labelText,
    this.onFieldSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.onChanged,
    this.margin = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: labelText != null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: margin.horizontal),
              child: Text(
                labelText ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextFormField(
            key: key,
            scrollPadding:
                const EdgeInsets.symmetric(horizontal: 16.0),
            controller: controller,
            maxLines: maxLines,
            validator: validator,
            textAlign: TextAlign.start,
            keyboardType: keyboardType,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabled: enabled,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintTextDirection: TextDirection.ltr
            ),
          ),
        ),
        Visibility(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: margin.horizontal),
          child: Text(
            helperText ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black38,
            ),
          ),
        ))
      ],
    );
  }
}
