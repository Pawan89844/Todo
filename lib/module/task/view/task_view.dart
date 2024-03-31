import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/text/app_text.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0, title: const AppText('Tasks'), centerTitle: true),
      body: ListView(),
    );
  }
}
