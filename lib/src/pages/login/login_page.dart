import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/theme.dart' as custom_theme;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          Column(
            children: [
              Header(),
              LoginForm(),
              Text('forgot password'),
              Text('SSO'),
              Text('register'),
            ],
          ),
        ],
      ),
    );
  }
}
