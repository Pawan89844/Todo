import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/home/app_navbar.dart';
import 'package:todo/module/onboarding/model/animated_route.dart';
import 'package:todo/module/onboarding/view/onboarding_view1.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';

import '../../home/view model/app_navbar_view_model.dart';

class OnBoardingView3 extends StatefulWidget {
  const OnBoardingView3({super.key});

  @override
  State<OnBoardingView3> createState() => _OnBoardingView3State();
}

class _OnBoardingView3State extends State<OnBoardingView3>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeController();
    scaleAnimation =
        Tween<double>(begin: 0.0, end: 50.0).animate(scaleController);
  }

  void _initializeController() {
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(
              context,
              AnimatingRoute(
                  route: ChangeNotifierProvider.value(
                      value: AppNavBarViewModel(), child: const AppNavBar())));
          Timer(
            const Duration(milliseconds: 300),
            () {
              // print('worked');
              scaleController.reset();
            },
          );
        }
      });
  }

  void _disposeController() {
    Timer(
      const Duration(milliseconds: 350),
      () {
        print('Animation disposed');
        scaleController.dispose();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _disposeController();
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponents(
      heading: 'Prioritize and Organize',
      imagePath: 'assets/images/priortize_placeholder.gif',
      bodyText:
          'Drag and drop tasks to rearrange your list. Mark completed tasks to see your progress!',
      buttonName: 'Let\'s Do This!',
      isAnimatable: true,
      scale: scaleAnimation,
      onPressed: () => scaleController.forward(),
    );
  }
}
