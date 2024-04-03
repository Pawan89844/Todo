import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';
import 'package:todo/module/task/view/add_task.dart';
import 'package:todo/widgets/text/app_text.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  Padding _taskList(String title, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: AppText(title),
          subtitle: AppText(status),
          trailing: Container(
            width: 25.0,
            height: 25.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TaskViewModel()..getTasks(),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: const AppText('Tasks', fontWeight: FontWeight.bold),
            centerTitle: true),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.push(context, AddTask.page() as Route<Object?>),
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          child: const Icon(CupertinoIcons.add, color: Colors.white),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: Consumer<TaskViewModel>(builder: (context, value, __) {
          if (value.tasks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              primary: true,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.tasks.length,
                  itemBuilder: (context, i) {
                    return _taskList(
                        value.tasks[i].title,
                        value.tasks[i].taskStatus == 1
                            ? 'In Progress'
                            : 'Todo');
                  },
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
