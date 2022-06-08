import 'package:customstuff/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? height, width, horizontalMargin;
  final Color? color;

  const CustomDivider(
      {Key? key, this.height, this.width, this.color, this.horizontalMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1,
      width: width,
      margin:
      EdgeInsets.symmetric(vertical: 5.0, horizontal: horizontalMargin ?? 0.0),
      color: color ?? borderColor,
    );
  }
}

class CustomDottedDivider extends StatelessWidget {
  const CustomDottedDivider({Key? key, this.height = 1, this.color})
      : super(key: key);
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 3.0),
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color ?? borderColor),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
