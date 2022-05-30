import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/setting.dart';
import 'package:flutter_project_manage/src/viewmodels/menu_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_project_manage/src/config/route.dart' as custom_route;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          ..._buildMainMenu(),
          const Spacer(),
          ListTile(
            leading: const FaIcon(
              // ignore: deprecated_member_use
              FontAwesomeIcons.signOutAlt,
              color: Colors.black,
            ),
            title: const Text(
              'LOGOUT',
              style: TextStyle(color: Colors.red),
            ),
            onTap: showDialogLogout,
          ),
        ],
      ),
    );
  }

  void showDialogLogout() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Text('Are you sure want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                SharedPreferences.getInstance().then(
                  (prefs) {
                    prefs.remove(Setting.token_pref);
                    // prefs.clear();
                    Navigator.of(dialogContext).pop();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      custom_route.Route.login,
                      (route) => false,
                    );
                  },
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  UserAccountsDrawerHeader _buildProfile() {
    return const UserAccountsDrawerHeader(
      accountName: Text('Hery Engineer'),
      accountEmail: Text('hery@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://cdn-images-1.medium.com/max/280/1*X5PBTDQQ2Csztg3a6wofIQ@2x.png'),
      ),
    );
  }

  List<ListTile> _buildMainMenu() {
    return MenuViewModel()
        .items
        .map(
          (item) => ListTile(
            title: Text(
              item.title!,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.0,
              ),
            ),
            leading: Badge(
              showBadge: item.icon == FontAwesomeIcons.inbox,
              badgeContent: const Text(
                '99',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              badgeColor: Colors.red,
              child: FaIcon(
                item.icon,
                color: item.iconColor,
              ),
            ),
            onTap: () {
              item.onTap!(context);
            },
          ),
        )
        .toList();
  }
}
