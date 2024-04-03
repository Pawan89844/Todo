import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String data;
  final Color color;
  final FontWeight? fontWeight;
  const AppHeading(this.data,
      {super.key,
      this.color = Colors.black,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: 22.0),
    );
  }
}
