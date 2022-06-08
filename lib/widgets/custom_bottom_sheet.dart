import 'package:customstuff/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String titleText;
  final Widget body;
  final Color? primaryColor;

  const CustomBottomSheet({
    Key? key,
    required this.titleText,
    required this.body,
    this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setValues) {
      return Container(
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: primaryColor ?? CustomColor.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  titleText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: body,
                ),
              ]),
        ),
      );
    });
  }
}
