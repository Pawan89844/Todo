import 'package:flutter/services.dart';
import 'package:todo/module/onboarding/model/onboarding_model.dart';
import 'package:yaml/yaml.dart';

mixin OnBoardingStatic<T> {
  Future<T> _parseYaml(String fileName) async {
    final file = await rootBundle.loadString('assets/yaml/$fileName');
    return loadYaml(file);
  }

  Future<List<OnBoardingModel>> parseOnboarding() async {
    YamlMap yaml = (await _parseYaml('onboarding_static.yaml')) as YamlMap;
    List<OnBoardingModel> onBoarding = (yaml['onboarding_content'] as List)
        .map((board) => OnBoardingModel.fromYaml(board))
        .toList();
    return onBoarding;
  }
}
