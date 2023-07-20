import 'package:virusscanapp/src/data/models/analysis_report/analysis_result.dart';
import 'package:virusscanapp/src/data/models/analysis_report/stats.dart';

class Attributes {
  int? date;
  String? status;
  Stats? stats;
  List<AnalysisResult>? listAnalysisResult;

  Attributes({
    this.date,
    this.status,
    this.stats,
    this.listAnalysisResult,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    date = json['date'] ?? 0;
    status = json['status'] ?? "unknown";
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    listAnalysisResult = [];
    late Iterable<dynamic> listJsonValue;
    if (json['last_analysis_results'] != null) {
      listJsonValue = json['last_analysis_results'].values;
    } else {
      listJsonValue = json['results'].values;
    }
    for (var element in listJsonValue) {
      final analysisResult = AnalysisResult.fromJson(element);
      listAnalysisResult!.add(analysisResult);
    }
  }
}
