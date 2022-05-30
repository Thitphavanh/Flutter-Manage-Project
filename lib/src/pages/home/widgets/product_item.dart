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

  Expanded _buildInfor() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'nter Miami CF ແລະເປັນເຈົ້າຂອງຮ່ວມຂອງ Salford City. ລາວໄດ້ຫຼິ້ນໃຫ້ກັບ Manchester United, Preston North End (ຢືມຕົວ), Real Madrid, ເອຊີມິລານ (ຢືມ), LA Galaxy',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('100000 LAK'),
                Text('222222 pices'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
