import 'package:virusscanapp/src/data/models/analysis_report/analysis_result.dart';
import 'package:virusscanapp/src/data/models/analysis_report/data.dart';
import 'package:virusscanapp/src/data/models/analysis_report/file_info.dart';
import 'package:virusscanapp/src/data/models/analysis_report/http_certificate.dart';
import 'package:virusscanapp/src/data/models/analysis_report/meta.dart';
import 'package:virusscanapp/src/data/models/analysis_report/stats.dart';
import 'package:virusscanapp/src/data/models/analysis_report/url_info.dart';
import 'package:virusscanapp/src/utils/date_time_utils.dart';

class AnalysisReportModel {
  Meta? meta;
  Data? data;

  AnalysisReportModel({
    this.meta,
    this.data,
  });

  AnalysisReportModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Stats get getStatus => data!.attributes!.stats!;

  String get getDateTime =>
      DateTimeUtils.convertIntToDateTime(number: data!.attributes!.date!);

  List<AnalysisResult> get getListAnalysisResult =>
      data!.attributes!.listAnalysisResult!;

  HttpCertificate? get getHttpCertificate => data!.attributes!.httpCertificate;

  FileInfo? get getFileInfo {
    if (meta != null) {
      return meta!.fileInfo;
    } else {
      return null;
    }
  }

  UrlInfo? get getUrlInfo {
    if (meta != null) {
      return meta!.urlInfo;
    } else {
      return null;
    }
  }
}
