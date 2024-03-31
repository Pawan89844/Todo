import 'package:flutter/services.dart';
import 'package:todo/data/task_status_model.dart';
import 'package:yaml/yaml.dart';

class TaskStatus {
  Future<List<TaskStatusModel>> parseStatus() async {
    final file = await rootBundle.loadString('assets/yaml/app_static.yaml');
    YamlMap yaml = loadYaml(file);
    List<TaskStatusModel> tasks = (yaml['progress_status'] as List)
        .map((status) => TaskStatusModel.fromYaml(status))
        .toList();
    return tasks;
  }
}
