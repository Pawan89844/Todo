import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/module/auth/view/signup_view.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/input/app_input_field.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final TextEditingController _emailController = TextEditingController();
  static CupertinoPageRoute page() {
    return CupertinoPageRoute(builder: (context) => SignInView());
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
              child: const AppHeading('Sign In', fontSize: 28.0),
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppText('Don\'t have an account ?'),
                TextButton(
                    onPressed: () => Navigator.push(context, SignUpView.page()),
                    child: const AppText('Register', color: Colors.blue))
              ],
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {},
                  child: const AppText('Forgot Password?', color: Colors.blue)),
            ),
            AppElevatedButton(buttonName: 'Sign In', onPressed: () {}),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}
