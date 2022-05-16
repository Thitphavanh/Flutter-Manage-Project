import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/assets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text('back'),
            ),
            Image.asset(Assets.LOGO_IMAGE),
          ],
        ),
      ),
    );
  }
}
