import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/theme.dart' as custom_theme;
import 'package:flutter_project_manage/src/pages/login/widgets/single_sign_on.dart';
import 'widgets/header.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: custom_theme.Theme.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                LoginForm(),
                SizedBox(height: 30.0),
                _buildTextButton('Forgot Password ?', onPressed: () {}),
                SingleSignOn(),
                SizedBox(height: 28.0),
                _buildTextButton("Don't have Account", onPressed: () {}),
                SizedBox(height: 80.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildTextButton(
    String text, {
    @required VoidCallback? onPressed,
    double fontSize = 16,
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
