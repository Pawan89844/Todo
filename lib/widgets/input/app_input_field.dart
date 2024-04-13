import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final String? labelText, hintText;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines, maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final void Function(String value)? onSubmitted;
  final bool obscureText;
  const AppInputField(
      {super.key,
      this.labelText,
      required this.controller,
      this.contentPadding = const EdgeInsets.only(left: 14.0, top: 22.0),
      this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.textInputAction,
      this.hintText,
      this.suffixIcon,
      this.onSubmitted,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final kBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.black12));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        obscureText: obscureText,
        decoration: InputDecoration(
            floatingLabelStyle: const TextStyle(color: Colors.blue),
            alignLabelWithHint: true,
            isDense: true,
            isCollapsed: false,
            labelText: labelText,
            contentPadding: contentPadding,
            border: kBorder,
            enabledBorder: kBorder,
            focusedBorder: kBorder,
            hintText: hintText,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
