import 'package:customstuff/constant/colors.dart';
import 'package:flutter/material.dart';

class ContainerDecoration {
  static decoration({Color? color, Color? bColor}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      border: Border.all(color: bColor ?? CustomColor.borderColor),
      borderRadius: BorderRadius.circular(5.0),
    );
  }
}
