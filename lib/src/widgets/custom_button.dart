import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String content;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorTheme.scienceBlue),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        child: Text(
          content,
          style: TextStyle(
              color: ColorTheme.scienceBlue,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
