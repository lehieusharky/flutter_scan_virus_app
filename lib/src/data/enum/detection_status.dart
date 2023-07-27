import 'package:virusscanapp/src/constants/text_constant.dart';

enum DetectionStatus {
  clean,
  unclean,
  detected,
  undetected;

  String get data {
    switch (this) {
      case DetectionStatus.clean:
        return TextConstant.clean;
      case DetectionStatus.unclean:
        return TextConstant.unClean;
      case DetectionStatus.detected:
        return TextConstant.detected;
      case DetectionStatus.undetected:
        return TextConstant.unDetected;
    }
  }
}
