import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/components/task_details.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';

class TaskDetailsView extends StatelessWidget {
  // final TaskViewModel viewModel;
  const TaskDetailsView({super.key});

  static MaterialPageRoute page() {
    return MaterialPageRoute(
      builder: (context) => const TaskDetailsView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: ChangeNotifierProvider(
        create: (context) => TaskViewModel(),
        child: const TaskDetailsComponent(),
      ),
    );
  }
}
