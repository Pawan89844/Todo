import 'package:flutter/services.dart';
import 'package:todo/data/task_status_model.dart';
import 'package:todo/module/task/model/task_model.dart';
import 'package:yaml/yaml.dart';

class TaskStatus<T> {
  Future<T> _parseYaml(String fileName) async {
    final file = await rootBundle.loadString('assets/yaml/$fileName');
    return loadYaml(file);
  }

  Future<List<TaskStatusModel>> parseStatus() async {
    YamlMap yaml = (await _parseYaml('app_static.yaml')) as YamlMap;
    List<TaskStatusModel> tasks = (yaml['progress_status'] as List)
        .map((status) => TaskStatusModel.fromYaml(status))
        .toList();
    return tasks;
  }

  Future<List<TaskModel>> getTasks() async {
    YamlMap yaml = (await _parseYaml('app_static.yaml') as YamlMap);
    List<TaskModel> taskModel = (yaml['tasks'] as List)
        .map((items) => TaskModel.fromYaml(items))
        .toList();
    return taskModel;
  }
}
