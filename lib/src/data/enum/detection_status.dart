enum DetectionStatus {
  clean,
  unclean,
  detected,
  undetected;

  String get data {
    switch (this) {
      case DetectionStatus.clean:
        return 'Clean';
      case DetectionStatus.unclean:
        return 'UnClean';
      case DetectionStatus.detected:
        return 'Detected';
      case DetectionStatus.undetected:
        return 'Undetected';
    }
  }
}