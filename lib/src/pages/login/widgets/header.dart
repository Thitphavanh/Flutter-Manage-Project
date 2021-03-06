import 'package:flutter/material.dart';

import '../../../constanrs/assets.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 60,
        bottom: 38,
      ),
      child: Image.asset(
        Assets.LOGO_IMAGE,
        height: 80,
      ),
    );
  }
}
