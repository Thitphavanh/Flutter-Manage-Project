import 'package:flutter/cupertino.dart';

class Theme {
  const Theme();
  static const Color gradientStart = Color.fromARGB(255, 227, 137, 163);
  static const Color gradientEnd = Color.fromARGB(255, 244, 226, 216);

  static const gradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
