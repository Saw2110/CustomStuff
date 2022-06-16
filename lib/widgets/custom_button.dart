import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Function onTap;
  final String buttonText;
  final Color textColor, buttonColor;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.textColor,
    required this.buttonColor,
    required this.buttonText,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(5.0)),
        margin: margin,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            buttonText,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
