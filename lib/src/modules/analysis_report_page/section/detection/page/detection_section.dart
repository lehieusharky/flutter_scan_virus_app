import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/data/enum/detection_status.dart';
import 'package:virusscanapp/src/data/models/detection_model.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/detection/widgets/detection_item.dart';

class DetectionSection extends StatelessWidget {
  final DetectionModel detection;
  const DetectionSection({
    super.key,
    required this.detection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: detection.getLengthResult,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return DetectionItem(
            trademark: detection.getListResult[index].engineName!,
            status: _getStatus(detection.getListResult[index].category!),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  DetectionStatus _getStatus(String category) {
    switch (category) {
      case TextConstant.harmless:
        return DetectionStatus.undetected;
      case 'clean':
        return DetectionStatus.clean;
      case 'undetected':
        return DetectionStatus.undetected;
      default:
        return DetectionStatus.detected;
    }
  }
}
