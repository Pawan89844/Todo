import 'package:flutter/services.dart';
import 'package:todo/data/task_status_model.dart';
import 'package:todo/module/task/model/task_model.dart';
import 'package:yaml/yaml.dart';

/// [TaskStatus] class contains static data such as button name and other static text.
/// all of the content is stored in the app_static.yaml file in assets/yaml/.
/// It also contain static task data to test out the application in debug mode.
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

  Future postTask(
      int id, int taskStatusId, String title, String description) async {
    YamlMap yaml = (await _parseYaml('app_static.yaml') as YamlMap);
    final data = {
      'id': (yaml['tasks'] as List).length,
      'taskStatus': 2,
      'title': 'sample',
      'description': 'A sample Description'
    };
    return (yaml['tasks'] as List).add(data);
  }
}
