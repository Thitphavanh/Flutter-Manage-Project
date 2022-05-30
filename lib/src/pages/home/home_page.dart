import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/assets.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/chart.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/custom_drawer.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/custom_tabbar.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/report.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/stock.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Stock Shop'),
          bottom: CustomTabbar(),
        ),
        drawer: const CustomDrawer(),
        body: const TabBarView(
          children: [
            Stock(),
            Chart(),
            Report(),
          ],
        ),
      ),
    );
  }
}
