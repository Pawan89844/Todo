import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/input/app_input_field.dart';
import 'package:todo/widgets/text/app_heading.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController _emailController = TextEditingController();
  static CupertinoPageRoute page() {
    return CupertinoPageRoute(builder: (context) => SignUpView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: const AppHeading('Create your account', fontSize: 28.0),
            ),
            AppInputField(
                maxLines: 1,
                controller: _emailController,
                labelText: 'Full Name',
                suffixIcon: const Icon(CupertinoIcons.person)),
            AppInputField(
                maxLines: 1,
                controller: _emailController,
                labelText: 'Email Address',
                suffixIcon: const Icon(CupertinoIcons.mail)),
            AppInputField(
                controller: _emailController,
                labelText: 'Password',
                maxLines: 1,
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.eye))),
            AppInputField(
                controller: _emailController,
                labelText: 'Confirm Password',
                maxLines: 1,
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.eye))),
            const Spacer(),
            AppElevatedButton(buttonName: 'Sign Up', onPressed: () {}),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}
