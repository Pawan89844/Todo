import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PieChart extends CustomPainter {
  final double inProgressPercentage;

  PieChart({required this.inProgressPercentage});
  @override
  void paint(Canvas canvas, Size size) {
    // final center = Offset(width, 2.0);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 4);
    Color inProgressColor = const Color(0xFF1F38AB);
    Color unAssignedTasks = const Color(0xFF86C3C2);

    double sweepAngle = 2 * pi * inProgressPercentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, true, Paint()..color = inProgressColor);

    double remainingPercentage = 1 - inProgressPercentage;
    double startAngle = 2 * pi * inProgressPercentage - pi / 2;
    sweepAngle = 2 * pi * remainingPercentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        sweepAngle, true, Paint()..color = unAssignedTasks);
  }

  @override
  bool shouldRepaint(covariant PieChart oldDelegate) {
    return true;
    // return data != oldDelegate.data;
  }
}
