import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String data;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  final double fontSize;
  final List<Shadow>? shadows;
  const AppHeading(this.data,
      {super.key,
      this.color = Colors.black,
      this.fontWeight = FontWeight.bold,
      this.textAlign = TextAlign.center,
      this.fontSize = 22.0,
      this.shadows});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          shadows: shadows),
    );
  }
}
