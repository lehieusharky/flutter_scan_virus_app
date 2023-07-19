import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final void Function() onPressed;

  const CustomIconButton({
    super.key,
    this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: 30.sp,
        color: ColorTheme.shark,
      ),
    );
  }
}
