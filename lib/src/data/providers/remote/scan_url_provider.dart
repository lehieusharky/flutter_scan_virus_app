import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/utils/end_points.dart';
import 'package:virusscanapp/src/utils/http_utils.dart';

abstract class ScanUrlProvider {
  Future<String> getIdScanUrl({required String url});
}

@Injectable(as: ScanUrlProvider)
class ScanUrlProviderImpl implements ScanUrlProvider {
  @override
  Future<String> getIdScanUrl({required String url}) async {
    try {
      final formData = FormData.fromMap({
        "url": url,
      });
      final HttpResponse response = await HttpHelper.post(
        EndPoints.apiScanUrl,
        data: formData,
      );
      final String id = response.body['data']['id'];
      return id;
    } catch (e) {
      throw Exception(e);
    }
  }
}
