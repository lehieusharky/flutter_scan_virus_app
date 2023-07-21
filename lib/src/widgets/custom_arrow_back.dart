import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class CustomArrowBackIcon extends StatelessWidget {
  final void Function()? onPressed;

  const CustomArrowBackIcon({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onPressed ?? () => context.go("/"),
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorTheme.shark.withOpacity(0.8),
            size: 35.sp,
          ),
        ),
      ],
    );
  }
}
