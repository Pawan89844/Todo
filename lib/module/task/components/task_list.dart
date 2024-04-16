import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';
import 'package:todo/module/task/view/add_task.dart';
import 'package:todo/module/task/view/task_details_view.dart';
import 'package:todo/style/theme/app_colors.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class TaskListComponent extends StatefulWidget {
  const TaskListComponent({super.key});

  @override
  State<TaskListComponent> createState() => _TaskListComponentState();
}

class _TaskListComponentState extends State<TaskListComponent>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: const AppText('Tasks', fontWeight: FontWeight.bold),
          centerTitle: true,
          bottom: TabBar(controller: _controller, tabs: const [
            Tab(
              child: AppText('Todo'),
            ),
            Tab(
              child: AppText('In Progress'),
            ),
            Tab(
              child: AppText('Completed'),
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, AddTask.page()),
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        child: const Icon(CupertinoIcons.add, color: Colors.white),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Consumer<TaskViewModel>(builder: (context, value, __) {
        if (value.tasks.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return TabBarView(
            controller: _controller,
            children: const [
              _TasksList(),
              _TasksList(),
              _TasksList(),
            ],
          );
        }
      }),
    );
  }
}

class _TasksList extends StatelessWidget {
  const _TasksList();

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<TaskViewModel>(context);
    return ListView.builder(
      primary: true,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      itemCount: value.tasks.length,
      itemBuilder: (context, i) {
        return _TaskList(
            title: value.tasks[i].title,
            taskStatus:
                value.tasks[i].taskStatus == 1 ? 'In Progress' : 'Todo');
      },
    );
  }
}

class _TaskList extends StatelessWidget {
  final String title;
  final String taskStatus;
  const _TaskList({required this.title, required this.taskStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: AppColor.cardColor,
        child: ListTile(
          onTap: () => Navigator.push(context, TaskDetailsView.page()),
          title: Container(
              alignment: Alignment.centerLeft,
              child: AppHeading(title,
                  fontSize: 16.0, textAlign: TextAlign.start)),
          subtitle: AppText(taskStatus),
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
}
