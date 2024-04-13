import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/model/onboarding_model.dart';
import 'package:todo/module/onboarding/view/onboarding_view1.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponents(
      heading: 'Add Tasks Quickly',
      imagePath: 'assets/images/add_task_placeholder.gif',
      bodyText:
          'Just tap the "+" button to add new tasks. Give them a clear title and set deadlines if needed.',
      buttonName: 'Next',
      onPressed: () => OnBoardingModel.controller
          .nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn),
    );
  }
}
