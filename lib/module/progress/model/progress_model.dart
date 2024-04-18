import 'package:yaml/yaml.dart';

class ProgressModel {
  final List<ProgressDay> days;
  final List<ProgressTasks> tasks;

  ProgressModel({required this.days, required this.tasks});

  factory ProgressModel.fromYaml(YamlMap yaml) {
    return ProgressModel(
        days: (yaml['progress_days'] as List)
            .map((e) => ProgressDay.fromYaml(e))
            .toList(),
        tasks: (yaml['progress_tasks'] as List)
            .map((e) => ProgressTasks.fromYaml(e))
            .toList());
  }
}

class ProgressDay {
  final int id;
  final String day;

  ProgressDay({required this.id, required this.day});

  factory ProgressDay.fromYaml(YamlMap yaml) {
    return ProgressDay(id: yaml['id'], day: yaml['day']);
  }
}

class ProgressTasks {
  final int id;
  final int amount;

  ProgressTasks({required this.id, required this.amount});

  factory ProgressTasks.fromYaml(YamlMap yaml) {
    return ProgressTasks(id: yaml['id'], amount: yaml['amount']);
  }
}
