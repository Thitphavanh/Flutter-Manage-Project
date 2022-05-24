import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu {
  final String? title;
  final IconData? icon;
  final Color? iconColor;
  final Function(BuildContext context)? onTap;

  const Menu(
    this.title, {
    this.icon,
    this.iconColor,
    this.onTap,
  });
}

class MenuViewModel {
  List<Menu> get items => <Menu>[
        Menu(
          'Profile',
          icon: FontAwesomeIcons.users,
          iconColor: Colors.red,
        ),
        Menu(
          'Dashboard',
          icon: FontAwesomeIcons.chartPie,
          iconColor: Colors.black,
        ),
        Menu(
          'Inbox',
          icon: FontAwesomeIcons.inbox,
          iconColor: Colors.blue,
        ),
        Menu(
          'Setting',
          // ignore: deprecated_member_use
          icon: FontAwesomeIcons.cogs,
          iconColor: Colors.grey,
        ),
      ];
}
