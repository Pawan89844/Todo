import 'package:flutter/material.dart';
import 'package:todo/widgets/input/app_input_field.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final TextEditingController _taskTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: Column(
        children: [
          AppInputField(
              labelText: 'Task title', controller: _taskTitleController),
        ],
      ),
    );
  }
}
