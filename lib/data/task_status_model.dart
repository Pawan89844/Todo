import 'package:yaml/yaml.dart';

class TaskStatusModel {
  final int id;
  final String status;

  TaskStatusModel(this.id, this.status);

  factory TaskStatusModel.fromYaml(YamlMap json) {
    return TaskStatusModel(json['id'], json['status']);
  }
}
