import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Dashboard',
        ),
      ),
      body: const Center(
        child: FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}
