import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/view/onboarding_view1.dart';

class OnBoardingView3 extends StatelessWidget {
  const OnBoardingView3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponents(
      heading: 'Prioritize and Organize',
      bodyText:
          'Drag and drop tasks to rearrange your list. Mark completed tasks to see your progress!',
      buttonName: 'Let\'s Do This!',
      onPressed: () {},
    );
  }
}
