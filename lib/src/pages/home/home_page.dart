import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/assets.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text('Stock Shop'),
      ),
      drawer: CustomDrawer(),
      body: Center(child: Image.asset(Assets.LOGO_IMAGE)),
    );
  }
}
