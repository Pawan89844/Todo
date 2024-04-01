import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines, maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const AppInputField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.contentPadding = const EdgeInsets.only(left: 14.0, top: 22.0),
      this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    final kBorder =
        OutlineInputBorder(borderRadius: BorderRadius.circular(8.0));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(color: Colors.blue),
            alignLabelWithHint: true,
            isDense: true,
            isCollapsed: false,
            labelText: labelText,
            contentPadding: contentPadding,
            border: kBorder,
            enabledBorder: kBorder,
            focusedBorder: kBorder),
      ),
    );
  }
}
