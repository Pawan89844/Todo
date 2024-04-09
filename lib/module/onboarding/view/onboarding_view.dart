import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/model/onboarding_model.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: SafeArea(
          child: PageView.builder(
              controller: OnBoardingModel.controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: OnBoardingModel.onBoardingPages.length,
              itemBuilder: (context, i) =>
                  OnBoardingModel.onBoardingPages[i].page)),
    );
  }
}
