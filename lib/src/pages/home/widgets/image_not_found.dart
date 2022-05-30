import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(
          Icons.image_not_supported,
          size: 50,
          color: Colors.black12,
        ),
        SizedBox(height: 8.0),
        Text(
          'Image not found',
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
