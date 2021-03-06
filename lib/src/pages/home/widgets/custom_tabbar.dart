import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/colors.dart';
import 'package:flutter_project_manage/src/viewmodels/tab_menu_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTabbar extends StatelessWidget implements PreferredSizeWidget {
  final List<TabMenu> tabsMenu;

  const CustomTabbar(this.tabsMenu);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabsMenu
          .map(
            (item) => Tab(
              child: Row(
                children: [
                  FaIcon(
                    item.icon,
                    color: MyColors.blue,
                  ),
                  SizedBox(width: 12),
                  Text(
                    item.title!,
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.blue,
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
