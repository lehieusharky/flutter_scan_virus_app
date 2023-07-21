import 'package:virusscanapp/src/data/models/analysis_report/analysis_result.dart';
import 'package:virusscanapp/src/data/models/analysis_report/http_certificate.dart';
import 'package:virusscanapp/src/data/models/analysis_report/stats.dart';

class Attributes {
  int? date;
  String? status;
  Stats? stats;
  List<AnalysisResult>? listAnalysisResult;
  String? asOwner;
  HttpCertificate? httpCertificate;

  Attributes({
    this.date,
    this.status,
    this.stats,
    this.httpCertificate,
    this.listAnalysisResult,
    this.asOwner,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json['last_analysis_date'] != null) {
      date = json['last_analysis_date'];
    } else {
      date = json['date'] ?? 0;
    }
    httpCertificate = json['last_https_certificate'] != null
        ? HttpCertificate.fromJson(json['last_https_certificate'])
        : null;

    asOwner = json['as_owner'] ?? 'unknown';
    status = json['status'] ?? "unknown";
    if (json['stats'] != null) {
      stats = Stats.fromJson(json['stats']);
    } else {
      stats = json['last_analysis_stats'] != null
          ? Stats.fromJson(json['last_analysis_stats'])
          : null;
    }

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
