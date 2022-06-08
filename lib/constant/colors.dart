import 'package:flutter/material.dart';

class CustomColor {
  static int colorCode = 0xFF607D8B;
  static Map<int, Color> mapColor = {
    50: const Color.fromRGBO(96, 125, 139, .0),
    100: const Color.fromRGBO(96, 125, 139, .1),
    200: const Color.fromRGBO(96, 125, 139, .2),
    300: const Color.fromRGBO(96, 125, 139, .3),
    400: const Color.fromRGBO(96, 125, 139, .4),
    500: const Color.fromRGBO(96, 125, 139, .5),
    600: const Color.fromRGBO(96, 125, 139, .6),
    700: const Color.fromRGBO(96, 125, 139, .7),
    800: const Color.fromRGBO(96, 125, 139, .8),
    900: const Color.fromRGBO(96, 125, 139, .9),
  };

  static MaterialColor primarySwatchColor = MaterialColor(colorCode, mapColor);

  /// Primary Color
  static Color primaryColor = Colors.blueGrey;

  /// Border Color
 static Color borderColor = Colors.grey.shade300;

  /// TextFormField color
  static Color textFormField = const Color(0xFFF4F6FC);
}
