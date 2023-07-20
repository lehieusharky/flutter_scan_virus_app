import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/enum/detection_status.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class DetectionItem extends StatelessWidget {
  final String trademark;
  final DetectionStatus status;

  const DetectionItem({
    super.key,
    required this.trademark,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              trademark,
              style: FontTheme.shark18W500Inter,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStatusIcon(status: status),
              SizedBox(width: 5.w),
              Text(
                status.data,
                style: FontTheme.shark15W500Inter,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusIcon({required DetectionStatus status}) {
    if (status == DetectionStatus.clean ||
        status == DetectionStatus.undetected) {
      return Icon(
        Icons.check_circle_outlined,
        size: 40.sp,
        color: ColorTheme.brightGreen,
      );
    } else {
      return Icon(
        Icons.cancel_outlined,
        size: 40.sp,
        color: ColorTheme.radicalRed,
      );
    }
  }
}
