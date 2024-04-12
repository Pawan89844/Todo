import 'package:flutter/cupertino.dart';

enum DescriptionEdit { active, complete }

mixin TaskDetailsViewModel on ChangeNotifier {
  DescriptionEdit? descriptionState;

  void editDescription(DescriptionEdit state) {
    descriptionState = state;
    notifyListeners();
  }
}
