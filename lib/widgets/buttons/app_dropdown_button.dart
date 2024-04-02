import 'package:flutter/material.dart';
import 'package:todo/widgets/text/app_text.dart';

class AppDropDown<T> extends StatefulWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;
  final String hintText;
  const AppDropDown(
      {super.key,
      this.value,
      required this.items,
      required this.onChanged,
      required this.hintText});

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45.0,
        padding: const EdgeInsets.only(top: 10.0, left: 8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0)),
        child: DropdownButton(
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: AppText(widget.hintText),
          ),
          isDense: true,
          isExpanded: true,
          value: widget.value,
          icon: Container(),
          borderRadius: BorderRadius.circular(8.0),
          underline: Container(),
          items: widget.items,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
