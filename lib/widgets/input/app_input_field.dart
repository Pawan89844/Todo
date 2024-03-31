import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  const AppInputField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.contentPadding = const EdgeInsets.only(left: 14.0, top: 22.0),
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
            isDense: true,
            isCollapsed: false,
            labelText: labelText,
            contentPadding: contentPadding,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
    );
  }
}
