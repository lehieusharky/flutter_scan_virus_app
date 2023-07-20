import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/utils/end_points.dart';
import 'package:virusscanapp/src/utils/http_utils.dart';

abstract class ScanFileProvider {
  Future<String> getIdScanFile({required File file});
}

@Injectable(as: ScanFileProvider)
class ScanFileProviderImpl implements ScanFileProvider {
  @override
  Future<String> getIdScanFile({required File file}) async {
    try {
      final HttpResponse response = await HttpHelper.uploadFile(
        EndPoints.apiScanFile,
        file: file,
      );
      final String id = response.body['data']['id'];
      return id;
    } catch (e) {
      throw Exception(e);
    }
  }
}
