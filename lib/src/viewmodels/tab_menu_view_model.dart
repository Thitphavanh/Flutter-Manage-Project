import 'package:flutter/cupertino.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/chart.dart';
import 'package:flutter_project_manage/src/pages/home/widgets/report.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabMenu {
  final String? title;
  final IconData? icon;
  final Widget? widget;

  TabMenu(this.title, this.widget, {this.icon});
}

class TabMenuViewModel {
  List<TabMenu> get items => <TabMenu>[
        TabMenu(
          'Stock',
          Stack(),
          icon: FontAwesomeIcons.box,
        ),
        TabMenu(
          'Chart',
          Chart(),
          icon: FontAwesomeIcons.chartArea,
        ),
        TabMenu(
          'Report',
          Report(),
          // ignore: deprecated_member_use
          icon: FontAwesomeIcons.fileAlt,
        ),
      ];
}
