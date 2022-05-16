import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleSignOn {
  final IconData? icon;
  final Color? backgroundColor;
  final VoidCallback? onPress;
  SingleSignOn({
    this.icon,
    this.backgroundColor,
    this.onPress,
  });
}

class SingleSignOnViewModel {
  List<SingleSignOn> get items => <SingleSignOn>[
        SingleSignOn(
            icon: FontAwesomeIcons.apple,
            backgroundColor: Color(0xFF323232),
            onPress: () {
              print('xxx');
            }),
        SingleSignOn(
            icon: FontAwesomeIcons.google,
            backgroundColor: Color(0xFFd7483b),
            onPress: () {print('xxx');}),
        SingleSignOn(
            icon: FontAwesomeIcons.facebook,
            backgroundColor: Color(0xFF4063ae),
            onPress: () {print('xxx');}),
        SingleSignOn(
            icon: FontAwesomeIcons.line,
            backgroundColor: Color(0xFF21b54d),
            onPress: () {print('xxx');}),
      ];
}
