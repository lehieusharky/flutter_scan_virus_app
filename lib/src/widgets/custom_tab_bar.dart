import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      labelColor: ColorTheme.scienceBlue,
      unselectedLabelColor: ColorTheme.shark,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
      indicatorWeight: 2.w,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorTheme.scienceBlue,
      tabs: widget.tabs,
      labelStyle: FontTheme.scienceBlue15W700Inter,
      unselectedLabelStyle: FontTheme.shark15W500Poppins,
    );
  }
}