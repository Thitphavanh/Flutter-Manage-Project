// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/api.dart';

import 'package:flutter_project_manage/src/models/product.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/image_not_found.dart';
import 'package:flutter_project_manage/src/utils/format.dart';

class ProductItem extends StatelessWidget {
  final double maxHeight;
  final Product product;

  const ProductItem(
    this.maxHeight,
    this.product,
  );

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
    const width = double.infinity;
    final productImage = product.image;

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: productImage != null && productImage.isNotEmpty
              ? Image.network('${API.imagesUrl}/$productImage')
              : const ImageNotFound(),
        ),
        if (product.stock! <= 0) _buildOutofStock(),
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
            Text(
              product.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'THB ${forMatCurrency.format(product.price)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${forMatNumber.format(product.stock)} pices',
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
