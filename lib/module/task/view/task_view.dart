import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/components/task_list.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TaskViewModel()..getTasks(),
      child: const TaskListComponent(),
    );
  }
}
