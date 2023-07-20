import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/data/providers/remote/get_analysis_report.dart';

abstract class GetAnalysisReportRepository {
  Future<AnalysisReportModel> getAnalysisReport({required String id});
}

@Injectable(as: GetAnalysisReportRepository)
class GetAnalysisReportRepositoryImpl implements GetAnalysisReportRepository {
  final GetAnalysisReportProvider _analysisReportProvider =
      GetIt.I.get<GetAnalysisReportProvider>();

  @override
  Future<AnalysisReportModel> getAnalysisReport({required String id}) async {
    return await _analysisReportProvider.getAnalysisReport(id: id);
  }
}
