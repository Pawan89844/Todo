import 'package:flutter/material.dart';
import 'package:todo/module/progress/model/progress_model.dart';
import 'package:todo/presentation/progress_static.dart';

class ProgressViewModel extends ChangeNotifier with ProgressStatic {
  // Objects
  ProgressModel? progress;
  // Lists

  // PREMITIVE TYPES

  // METHODS AND FUNCTIONS

  void getProgress() async {
    ProgressModel mod = await parseProgress();
    progress = mod;
    notifyListeners();
  }
}
