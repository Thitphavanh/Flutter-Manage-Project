import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.name = '-', this.age = 0}) : super(key: key);

  final String? name;
  final int? age;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {}
                Navigator.pop(context);
              },
              child: Text('back')),
          Text(widget.name!),
          Text(widget.age.toString()),
          Image.asset(Assets.LOGO_IMAGE),
        ],
      ),
    );
  }
}
