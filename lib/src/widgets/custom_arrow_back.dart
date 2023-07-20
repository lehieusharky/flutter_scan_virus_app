import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class CustomArrowBackIcon extends StatelessWidget {
  const CustomArrowBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.go("/"),
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorTheme.shark.withOpacity(0.8),
              size: 35.sp,
            ),
          ),
        ],
      ),
    );
  }
}
