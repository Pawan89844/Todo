import 'package:flutter/material.dart';
import 'package:todo/widgets/text/app_heading.dart';

class OnBoardingView1 extends StatelessWidget {
  const OnBoardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: const Column(
        children: [AppHeading('Welcome to Your Productivity Partner!')],
      ),
    );
  }
}
