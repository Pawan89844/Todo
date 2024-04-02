import 'package:flutter/material.dart';
import 'package:todo/widgets/text/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText('Hey, You\'ve reached to Home view'),
      ),
    );
  }
}
