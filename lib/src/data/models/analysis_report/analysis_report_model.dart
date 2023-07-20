import 'package:virusscanapp/src/data/models/analysis_report/data.dart';
import 'package:virusscanapp/src/data/models/analysis_report/meta.dart';

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
}
