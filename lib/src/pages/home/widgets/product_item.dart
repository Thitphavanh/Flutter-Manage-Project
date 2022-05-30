import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;
  ProductItem(this.maxHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildImage(),
          _buildInfor(),
        ],
      ),
    );
  }

  Image _buildImage() {
    final height = maxHeight * 0.7;
    final productImage =
        'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png';
    return Image.network(
      productImage,
      height: height,
    );
  }

  Column _buildInfor() {
    return Column(
      children: [
        Text(''),
        Row(
          children: [
            Text('100000'),
            Text('222222'),
          ],
        )
      ],
    );
  }
}
