import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Assets.LOGO_IMAGE),
        ],
      ),
    );
  }
}
