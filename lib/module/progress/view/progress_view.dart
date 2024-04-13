import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/progress/components/progress_component.dart';
import 'package:todo/module/progress/view%20model/progress_view_model.dart';
import 'package:todo/widgets/text/app_heading.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          title: const AppHeading('Progress'),
          centerTitle: true),
      body: ChangeNotifierProvider(
          create: (context) => ProgressViewModel()..getProgress(),
          child: const ProgressComponent()),
    );
  }
}
