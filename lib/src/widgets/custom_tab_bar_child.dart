import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/widgets/custom_icon_button.dart';

class CustomTabChild extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final double? height;
  final Widget? child;
  final CustomIconButton? icon;

  const CustomTabChild({
    super.key,
    required this.title,
    this.iconData,
    this.height,
    this.child, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Tab(
        icon: icon,
        height: height,
        text: title,
        child: child,
      ),
    );
  }
}