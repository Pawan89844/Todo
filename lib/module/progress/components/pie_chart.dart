import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PieChart extends CustomPainter {
  final double width;
  final double height;
  final List<PieChartData> data;

  PieChart({required this.width, required this.height, required this.data});
  @override
  void paint(Canvas canvas, Size size) {
    // final center = Offset(width, 2.0);
    final center = Offset(width / 2, height / 2);
    final radius = math.min(width / 2, height / 2);
    final paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, paint);
    // double total = 0;
    // for (var item in data) {
    //   total += item.value;
    // }

    // double startAngle = 270; // degrees - starting angle

    // for (var item in data) {
    //   double sweepAngle = (item.value / total) * 360; // degrees - sweep angle
    //   final paint = Paint()
    //     ..color = item.color
    //     ..style = PaintingStyle.fill;
    //   canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
    //       (startAngle), (sweepAngle), true, paint);
    //   startAngle += sweepAngle;
    // }
  }

  @override
  bool shouldRepaint(covariant PieChart oldDelegate) {
    return data != oldDelegate.data;
  }
}

class PieChartData {
  final double value;
  final Color color;

  PieChartData({required this.value, required this.color});
}
