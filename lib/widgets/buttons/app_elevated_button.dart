import 'package:flutter/material.dart';
import 'package:todo/widgets/text/app_text.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonName;
  const AppElevatedButton(
      {super.key, this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: AppText(
          buttonName,
          color: Colors.white,
        ),
      ),
    );
  }
}
