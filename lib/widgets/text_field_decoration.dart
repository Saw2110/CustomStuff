import 'package:customstuff/constant/colors.dart';
import 'package:customstuff/constant/text_style.dart';
import 'package:flutter/material.dart';

class TextFormDecoration {
  static decoration({
    required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    IconData? icon,
    Color? primaryColor,
    Color? formFieldColor,
    TextStyle? hintStyle,
    Color? borderColor,
  }) {
    return InputDecoration(
      prefixIcon:
          (prefixIcon == null) ? null : Icon(prefixIcon, color: primaryColor),
      suffixIcon:
          (suffixIcon == null) ? null : Icon(suffixIcon, color: primaryColor),
      fillColor: formFieldColor,
      filled: true,
      counter: const Offstage(),
      isDense: true,
      hintText: hintText,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
      hintStyle: hintStyle ?? CustomTextStyle.kHintText,
      contentPadding: const EdgeInsets.all(10.0),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide:
              BorderSide(color: primaryColor ?? CustomColor.primaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide:
              BorderSide(color: borderColor ?? CustomColor.borderColor)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }
  static decoration1({
    required String hintText,
    IconData? icon,
    Color? primaryColor,
    Color? formFieldColor,
    TextStyle? hintStyle,
    Color? borderColor,
    EdgeInsets? contentPadding,
  }) {
    return InputDecoration(
      prefixIcon: (icon == null) ? null : Icon(icon, color: primaryColor),
      fillColor: formFieldColor,
      filled: true,
      counter: const Offstage(),
      isDense: true,
      hintText: hintText,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
      hintStyle: hintStyle,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(color: primaryColor ?? CustomColor.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(color: borderColor ?? CustomColor.borderColor),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
