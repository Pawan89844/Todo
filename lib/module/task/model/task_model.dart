import 'package:yaml/yaml.dart';

class TaskModel {
  final int id;
  final int taskStatus;
  final String title;
  final String description;

  TaskModel(
      {required this.id,
      required this.taskStatus,
      required this.title,
      required this.description});

  factory TaskModel.fromYaml(YamlMap map) {
    return TaskModel(
        id: map['id'],
        taskStatus: map['taskStatus'],
        title: map['title'],
        description: map['description']);
  }
}
