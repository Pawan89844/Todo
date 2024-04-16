import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/home/app_navbar.dart';
import 'package:todo/module/home/view%20model/app_navbar_view_model.dart';
import 'package:todo/module/onboarding/components/onboarding_component.dart';
import 'package:todo/module/onboarding/model/animated_route.dart';
import 'package:todo/module/onboarding/model/onboarding_model.dart';
import 'package:todo/presentation/onboarding_static.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with OnBoardingStatic, TickerProviderStateMixin {
  List<OnBoardingModel> onBoarding = <OnBoardingModel>[];
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    getOnBoardingData();
    _initializeController();
    scaleAnimation =
        Tween<double>(begin: 0.0, end: 50.0).animate(scaleController);
  }

  @override
  void dispose() {
    super.dispose();
    OnBoardingModel.controller.dispose();
    _disposeController();
  }

  void getOnBoardingData() async {
    List<OnBoardingModel> model = await parseOnboarding();
    onBoarding = model;
    setState(() {});
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
        scaleController.dispose();
      },
    );
  }

  void navigatePage(int i) {
    if (i == 2) {
      scaleController.forward();
    } else {
      OnBoardingModel.controller
          .nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn);
    }
  }

  String _heading(int i, String head) {
    if (i == 0) {
      var newS = head.split(' ');
      for (int i = 0; i < newS.length; i++) {
        if (newS[i] == 'Productivity') {
          newS[i] += '\n';
        }
      }
      String ss = newS.join(' ').toString();
      return ss;
    } else {
      return head;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: SafeArea(
          child: PageView.builder(
              controller: OnBoardingModel.controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoarding.length,
              itemBuilder: (context, i) => OnBoardingComponents(
                    heading: _heading(i, onBoarding[i].heading),
                    imagePath: onBoarding[i].imagePath,
                    bodyText: onBoarding[i].bodyText,
                    buttonName: onBoarding[i].buttonName,
                    isAnimatable: onBoarding[i].pageId == 2 ? true : false,
                    scale: scaleAnimation,
                    onPressed: () => navigatePage(i),
                  ))),
    );
  }
}
