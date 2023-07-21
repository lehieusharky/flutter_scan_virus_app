import 'package:virusscanapp/src/data/models/analysis_report/analysis_result.dart';

class DetectionModel {
  final List<AnalysisResult> listAnalysisResult;

  DetectionModel({required this.listAnalysisResult});

  List<AnalysisResult> get getListResult => listAnalysisResult;

  int get getLengthResult => listAnalysisResult.length;
}
