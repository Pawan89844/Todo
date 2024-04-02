import 'package:flutter/material.dart';
import 'package:todo/module/account/view/account_view.dart';
import 'package:todo/module/home/view/home_view.dart';
import 'package:todo/module/progress/view/progress_view.dart';
import 'package:todo/module/task/view/task_view.dart';

class AppNavBarModel {
  final Icon icon;
  final String label;

  AppNavBarModel(this.icon, this.label);

  static List<AppNavPages> pages = [
    AppNavPages(0, const HomeView()),
    AppNavPages(1, const TaskView()),
    AppNavPages(2, const ProgressView()),
    AppNavPages(3, const AccountView()),
  ];
  static const List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  ];
}

class AppNavPages {
  final int pageId;
  final Widget page;

  AppNavPages(this.pageId, this.page);
}
