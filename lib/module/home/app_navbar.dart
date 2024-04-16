import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/home/model/app_navbar_model.dart';
import 'package:todo/module/home/view%20model/app_navbar_view_model.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});
  static MaterialPageRoute page() {
    return MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider.value(
          value: AppNavBarViewModel(), child: const AppNavBar()),
    );
  }

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNavBarViewModel>(builder: (context, nav, ___) {
      return Scaffold(
        body: AppNavBarModel.pages.elementAt(nav.currentIndex).page,
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            currentIndex: nav.currentIndex,
            onTap: (value) => nav.changeIndex(value),
            items: AppNavBarModel.items,
            type: BottomNavigationBarType.fixed),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Navigator.push(context, AddTask.page),
        //   shape: const CircleBorder(),
        //   backgroundColor: Colors.blue,
        //   child: const Icon(Icons.add, color: Colors.white),
        // ),
      );
    });
  }
}
