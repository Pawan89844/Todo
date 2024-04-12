import 'package:flutter/foundation.dart';

class AppNavBarViewModel extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    notifyListeners();
  }
}
