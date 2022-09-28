import 'package:flutter/cupertino.dart';
import 'package:flutter_project_manage/src/pages/management/management_page.dart';
import 'package:flutter_project_manage/src/pages/pages.dart';

class Route {
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const management = '/management';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => HomePage(),
    login: (context) => const LoginPage(),
    dashboard: (context) => const DashBoardPage(),
    management: (context) => const ManagementPage(),
  };
}
