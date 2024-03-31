import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/input/app_input_field.dart';
import 'package:todo/widgets/text/app_text.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 45.0,
                      padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: DropdownButton(
                        hint: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: AppText('Task Status'),
                        ),
                        isDense: true,
                        isExpanded: true,
                        value: value.selectedProgress,
                        icon: Container(),
                        borderRadius: BorderRadius.circular(8.0),
                        underline: Container(),
                        items: value.taskStatus
                            .map((task) => DropdownMenuItem(
                                value: task.id, child: AppText(task.status)))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
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
