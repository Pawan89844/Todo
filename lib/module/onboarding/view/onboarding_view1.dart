import 'package:flutter/material.dart';
import 'package:todo/module/onboarding/model/onboarding_model.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class OnBoardingView1 extends StatelessWidget {
  const OnBoardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingComponents(
      heading: 'Welcome to Your Productivity Partner!',
      imagePath: 'assets/images/welcome_screen_placeholder.png',
      onPressed: () => OnBoardingModel.controller
          .nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn),
      bodyText:
          'Take control of your day with our powerful yet\nsimple-to-use to-do list app.',
      buttonName: 'Get Started',
    );
  }
}

class OnBoardingComponents extends StatelessWidget {
  final String heading, bodyText, buttonName, imagePath;
  final void Function()? onPressed;
  const OnBoardingComponents(
      {super.key,
      required this.heading,
      required this.bodyText,
      required this.buttonName,
      required this.onPressed,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeading(heading),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .6,
          child: Image.asset(imagePath),
        ),
        const Spacer(),
        AppText(
          bodyText,
          align: TextAlign.center,
        ),
        const SizedBox(height: 10.0),
        AppElevatedButton(
          buttonName: buttonName,
          onPressed: onPressed,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
