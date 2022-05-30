import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/colors.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/custom_drawer.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/custom_tabbar.dart';
import 'package:flutter_project_manage/src/viewmodels/tab_menu_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabsMenu = TabMenuViewModel().items;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsMenu.length,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: const CustomDrawer(),
        body: TabBarView(
          children: _tabsMenu.map((item) => item.widget!).toList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text('Stock Shop'),
      bottom: CustomTabbar(_tabsMenu),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border,
            color: MyColors.deeporange,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.qr_code,
            color: MyColors.deeporange,
          ),
        ),
      ],
    );
  }
}
