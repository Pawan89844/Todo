import 'package:flutter/material.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';
import 'package:animator/animator.dart';

class OnBoardingComponents extends StatelessWidget {
  final String heading, bodyText, buttonName, imagePath;
  final void Function()? onPressed;
  final bool isAnimatable;
  final Animation<double>? scale;
  const OnBoardingComponents(
      {super.key,
      required this.heading,
      required this.bodyText,
      required this.buttonName,
      required this.onPressed,
      required this.imagePath,
      this.isAnimatable = false,
      this.scale});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(alignment: Alignment.center, child: AppHeading(heading)),
        const SizedBox(height: 10.0),
        if (isAnimatable) ...[
          Container(
            alignment: Alignment.center,
            height: size.height * .6,
            width: isAnimatable ? size.width * .9 : null,
            child: Animator(
                duration: const Duration(milliseconds: 2000),
                cycles: 0,
                curve: Curves.easeIn,
                tween: Tween<double>(begin: 0.0, end: 10.0),
                builder: (context, animatorState, __) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: animatorState.value * 5),
                      Image.asset(imagePath)
                    ],
                  );
                }),
          ),
        ] else ...[
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .6,
            child: Image.asset(imagePath),
          ),
        ],
        const Spacer(),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 14.0),
            child: AppText(bodyText, align: TextAlign.center)),
        const SizedBox(height: 10.0),
        if (isAnimatable)
          AnimatedBuilder(
            animation: scale as Animation<double>,
            builder: (c, child) => Transform.scale(
              scale: scale?.value,
              child: Container(
                height: scale?.value,
                width: scale?.value,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        const SizedBox(height: 5.0),
        AppElevatedButton(
          buttonName: buttonName,
          onPressed: onPressed,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
