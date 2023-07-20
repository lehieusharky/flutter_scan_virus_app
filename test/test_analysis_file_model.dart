import 'package:flutter_test/flutter_test.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';

import 'mock/json_analysis_model.dart';

void main() {
  const mockAnalysisResult = MockModel.json;
  test(
    'Test analysis report model',
    () async {
      final AnalysisReportModel analysisReport =
          AnalysisReportModel.fromJson(mockAnalysisResult);
      expect(
        analysisReport.data!.attributes!.listAnalysisResult?[0].engineName,
        'Bkav',
      );
      expect(analysisReport.data!.attributes!.date, 1689751260);
    },
  );
}
