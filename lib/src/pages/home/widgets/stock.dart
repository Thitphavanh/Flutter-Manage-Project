import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/colors.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/product_item.dart';
import 'package:flutter_project_manage/src/services/network_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/product.dart';
import 'package:flutter_project_manage/src/config/route.dart' as custom_route;

class Stock extends StatefulWidget {
  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  final _spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNetwork(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.deeporange,
        onPressed: () {
          Navigator.pushNamed(context, custom_route.Route.management)
              .then((value) {
            setState(() {});
          });
        },
        child: const FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }

  FutureBuilder<List<Product>> _buildNetwork() {
    return FutureBuilder<List<Product>>(
      future: NetworkService().getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? product = snapshot.data;
          if (product == null || product.isEmpty) {
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
            child: _buildProductGridView(product),
          );
        }
        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.only(top: 22.0),
            alignment: Alignment.topCenter,
            child: Text((snapshot.error as DioError).message),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Product> products) {
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
          final product = products[index];
          return ProductItem(
            constraints.maxHeight,
            product,
            onTap: () {
              Navigator.pushNamed(
                context,
                custom_route.Route.management,
                arguments: product,
              ).then((value) {
                setState(() {});
              });
            },
          );
        },
      ),
      itemCount: products.length,
    );
  }
}
