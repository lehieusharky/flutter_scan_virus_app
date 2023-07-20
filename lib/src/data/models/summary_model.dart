import 'package:virusscanapp/src/data/models/analysis_report/stats.dart';

class SummaryModel {
  final Stats status;
  final String datetime;

  SummaryModel({required this.status, required this.datetime});

  int get getMalicious => status.malicious ?? 0;

  int get getTotal =>
      status.harmless! + status.suspicious! + status.undetected!;
}
