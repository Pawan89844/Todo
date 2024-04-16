import 'package:flutter/services.dart';
import 'package:todo/module/progress/model/progress_model.dart';
import 'package:yaml/yaml.dart';

mixin ProgressStatic<T> {
  Future<T> _parseYaml(String fileName) async {
    final file = await rootBundle.loadString('assets/yaml/$fileName');
    return loadYaml(file);
  }

  Future<ProgressModel> parseProgress() async {
    YamlMap yaml = (await _parseYaml('progress_static.yaml')) as YamlMap;
    return ProgressModel.fromYaml(yaml);
  }
}
