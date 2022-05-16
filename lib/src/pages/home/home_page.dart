import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/assets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final models = Map<String, Object>.from(arguments);
    Object? name = '-';
    Object? age = 0;
    if (models['name'] is String) {
      name = models['name'];
    }
    if (models['age'] is int) {
      age = models['age'];
    }

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
            Text('${name}'),
            Text(age.toString()),
            Image.asset(Assets.LOGO_IMAGE),
          ],
        ),
      ),
    );
  }
}
