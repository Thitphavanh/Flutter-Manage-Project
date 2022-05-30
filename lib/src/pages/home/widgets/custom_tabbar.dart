import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(
          child: Text('Stock'),
        ),
        Tab(
          child: Text('Chart'),
        ),
        Tab(
          child: Text('Report'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
