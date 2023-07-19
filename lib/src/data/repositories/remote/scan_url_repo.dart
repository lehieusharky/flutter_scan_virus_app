import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/data/providers/remote/scan_url_provider.dart';

abstract class ScanUrlRepository {
  Future<String> getIdScanUrl({required String url});
}

@Injectable(as: ScanUrlRepository)
class ScanUrlRepositoryImpl extends ScanUrlRepository {
  final ScanUrlProvider _scanUrlProvider = GetIt.I.get<ScanUrlProvider>();

  @override
  Future<String> getIdScanUrl({required String url}) async {
    return await _scanUrlProvider.getIdScanUrl(url: url);
  }
}
