import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/animation_test.dart';
import 'package:todo/module/onboarding/view/onboarding_view.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardingView(),
    );
  }
}
