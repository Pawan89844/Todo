import 'package:flutter/services.dart';
import 'package:todo/module/account/model/account_model.dart';
import 'package:yaml/yaml.dart';

mixin AccountStatic<T> {
  Future<T> _parseYaml(String fileName) async {
    final file = await rootBundle.loadString('assets/yaml/$fileName');
    return loadYaml(file);
  }

  Future<AccountModel> parseAccount() async {
    YamlMap yaml = (await _parseYaml('profile_static.yaml')) as YamlMap;
    return AccountModel.fromYaml(yaml);
  }
}
