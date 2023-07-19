import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class CustomLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const CustomLoadingWidget({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(
        value: 500,
        color: ColorTheme.scienceBlue,
      ),
    );
  }
}
