import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color color;
  const AppText(this.data, {super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: color),
    );
  }
}
