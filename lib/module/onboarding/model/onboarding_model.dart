import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/view/onboarding_view1.dart';
import 'package:todo/module/onboarding/view/onboarding_view2.dart';
import 'package:todo/module/onboarding/view/onboarding_view3.dart';

class OnBoardingModel {
  final int pageId;
  final Widget page;

  OnBoardingModel(this.pageId, this.page);

  static List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(1, const OnBoardingView1()),
    OnBoardingModel(2, const OnboardingView2()),
    OnBoardingModel(3, const OnBoardingView3()),
  ];
}
