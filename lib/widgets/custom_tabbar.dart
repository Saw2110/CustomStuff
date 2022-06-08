import 'package:customstuff/constant/colors.dart';
import 'package:customstuff/constant/text_style.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final String tabOneText, tabTwoText;
  final TabController? controller;
  final Color? customPrimaryColor;

  const CustomTabBar({
    Key? key,
    required this.tabOneText,
    required this.tabTwoText,
    this.controller,
    this.customPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ColoredBox(
        color: Colors.white,
        child: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: customPrimaryColor ?? CustomColor.primaryColor,
            indicatorColor: customPrimaryColor ?? CustomColor.primaryColor.withOpacity(0.9),
            controller: controller,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(child: Text(tabOneText, style: CustomTextStyle.kTabBarText)),
              Tab(child: Text(tabTwoText, style: CustomTextStyle.kTabBarText)),
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
