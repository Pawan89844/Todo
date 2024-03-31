import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';
import 'package:todo/widgets/buttons/app_dropdown_button.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/input/app_input_field.dart';
import 'package:todo/widgets/text/app_text.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0, centerTitle: true, title: const AppText('Add Task')),
      body: ChangeNotifierProvider.value(
        value: TaskViewModel()..getStatus(),
        child: Consumer<TaskViewModel>(
          builder: (context, value, child) {
            if (value.taskStatus.isEmpty) {
              return Container();
            } else {
              return Column(
                children: [
                  AppInputField(
                      labelText: 'Task title',
                      controller: value.taskTitleController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text),
                  AppDropDown(
                    hintText: 'Task Status',
                    value: value.selectedProgress,
                    items: value.taskStatus
                        .map((task) => DropdownMenuItem(
                            value: task.id, child: AppText(task.status)))
                        .toList(),
                    onChanged: (selVal) => value.changeStatus(selVal),
                  ),
                  AppInputField(
                      labelText: 'Description',
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      controller: value.taskDescriptionController),
                  const Spacer(),
                  AppElevatedButton(
                    onPressed: () {},
                    buttonName: 'Add Task',
                  ),
                  const SizedBox(height: 10.0)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
