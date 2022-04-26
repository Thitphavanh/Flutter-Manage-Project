import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/theme.dart' as custom_theme;
import 'package:flutter_project_manage/src/constanrs/assets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: custom_theme.Theme.gradient,
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 38),
                child: Image.asset(Assets.LOGO_IMAGE),
              ),
              Text('form'),
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
