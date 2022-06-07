import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/image_not_found.dart';
import 'package:flutter_project_manage/src/utils/format.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;
  ProductItem(this.maxHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('xxxx');
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildImage(),
            _buildInfor(),
          ],
        ),
      ),
    );
  }

  Stack _buildImage() {
    final height = maxHeight * 0.7;
    final width = double.infinity;
    final productImage =
        'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png';

    final stock = 0;

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: productImage != null && productImage.isNotEmpty
              ? Image.network(productImage)
              : ImageNotFound(),
        ),
        if (stock <= 0) _buildOutofStock(),
      ],
    );
  }

  Expanded _buildInfor() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking You've visited this page many times. Last visit: 4/16/22",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₭${forMatCurrency.format(10000)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${forMatNumber.format(1500)} pices',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildOutofStock() {
    return const Positioned(
      right: 2,
      top: 2,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: Text(
            'Out of stack',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
