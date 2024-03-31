import 'package:flutter/material.dart';
import 'package:todo/data/task_status_model.dart';
import 'package:todo/presentation/task_status.dart';

class TaskViewModel extends ChangeNotifier {
  // Controllers
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  // Objects
  final TaskStatus _status = TaskStatus();

  // Data variables
  List<TaskStatusModel> _taskStatus = <TaskStatusModel>[];

  // Selection variables
  int? selectedProgress;

  // Getters
  List<TaskStatusModel> get taskStatus => _taskStatus;

  // State manuplation functions and methods
  void getStatus() async {
    List<TaskStatusModel> parsedModel = await _status.parseStatus();
    _taskStatus = parsedModel;
    notifyListeners();
  }
}
