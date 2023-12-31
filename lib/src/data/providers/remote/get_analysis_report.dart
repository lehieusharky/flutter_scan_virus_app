import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/utils/end_points.dart';
import 'package:virusscanapp/src/utils/http_utils.dart';
import 'package:virusscanapp/src/utils/regex_utils.dart';

abstract class GetAnalysisReportProvider {
  Future<AnalysisReportModel> getAnalysisReport({required String id});

  Future<AnalysisReportModel> getIpAddressAnalysisReport({
    required String ipAddress,
  });
}

@Injectable(as: GetAnalysisReportProvider)
class GetAnalysisReportProviderImpl implements GetAnalysisReportProvider {
  @override
  Future<AnalysisReportModel> getAnalysisReport({required String id}) async {
    try {
      final String url = "${EndPoints.apiAnalysis}/$id";
      final HttpResponse response = await HttpHelper.get(
        url,
        queryParameters: {
          "id": RegexUtils.removeTrailing(originString: id),
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        return AnalysisReportModel.fromJson(jsonData);
      }
      return AnalysisReportModel();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AnalysisReportModel> getIpAddressAnalysisReport({
    required String ipAddress,
  }) async {
    try {
      final String url = "${EndPoints.apiIpAddressAnalysis}/$ipAddress";
      final HttpResponse response = await HttpHelper.get(url);

      if (response.statusCode == 200) {
        final jsonData = response.body;
        return AnalysisReportModel.fromJson(jsonData);
      }
      return AnalysisReportModel();
    } catch (e) {
      throw Exception(e);
    }
  }
}
