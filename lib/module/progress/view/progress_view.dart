import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/progress/components/progress_component.dart';
import 'package:todo/module/progress/view%20model/progress_view_model.dart';
import 'package:todo/widgets/text/app_heading.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({super.key});

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const AppHeading('Progress'),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProgressViewModel()..getProgress(),
        child: const ProgressComponent(),
      ),
    );
  }
}
