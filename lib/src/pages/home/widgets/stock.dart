import 'package:flutter/material.dart';

class Stock extends StatelessWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterLogo(
        style: FlutterLogoStyle.horizontal,
        size: 450,
      ),
    );
  }
}
