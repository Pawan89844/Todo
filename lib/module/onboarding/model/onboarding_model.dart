import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class OnBoardingModel {
  final int pageId;
  final String heading;
  final String imagePath;
  final String bodyText;
  final String buttonName;
  // final Widget page;
  static PageController controller = PageController();

  OnBoardingModel(
      {required this.pageId,
      required this.heading,
      required this.imagePath,
      required this.bodyText,
      required this.buttonName});

  factory OnBoardingModel.fromYaml(YamlMap yaml) {
    return OnBoardingModel(
        pageId: yaml['id'],
        heading: yaml['heading'],
        imagePath: yaml['imagePath'],
        bodyText: yaml['bodyText'],
        buttonName: yaml['buttonName']);
  }

  // static List<OnBoardingModel> onBoardingPages = [
  //   OnBoardingModel(1, const OnBoardingView1()),
  //   OnBoardingModel(2, const OnboardingView2()),
  //   OnBoardingModel(3, const OnBoardingView3()),
  // ];
}
