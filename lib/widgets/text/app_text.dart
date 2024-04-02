import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? align;
  const AppText(this.data,
      {super.key, this.color = Colors.black, this.fontWeight, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: TextStyle(color: color, fontWeight: fontWeight),
    );
  }
}
