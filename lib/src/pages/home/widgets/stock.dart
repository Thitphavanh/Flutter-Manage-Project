import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/product_item.dart';
import 'package:flutter_project_manage/src/services/network_service.dart';
import '../../../models/post_model.dart';

class Stock extends StatefulWidget {
  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  final _spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: NetworkService().fetchPosts(0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Post>? post = snapshot.data;
          if (post == null || post.isEmpty) {
            return Container(
              margin: const EdgeInsets.only(top: 22.0),
              alignment: Alignment.topCenter,
              child: const Text('No Data'),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: _buildProductGridView(post),
          );
        }
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.only(top: 22.0),
            alignment: Alignment.topCenter,
            child: Text(snapshot.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Post> post) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
        top: _spacing,
        bottom: 150,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
      ),
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return ProductItem(constraints.maxHeight);
        },
      ),
      itemCount: post.length,
    );
  }
}
