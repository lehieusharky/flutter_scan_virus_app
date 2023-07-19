import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/data/providers/remote/scan_file_provider.dart';

abstract class ScanFileRepository {
  Future<String> getIdScanFile({required File file});
}

@Injectable(as: ScanFileRepository)
class ScanFileRepositoryImpl extends ScanFileRepository {
  final ScanFileProvider _scanFileProvider = GetIt.I.get<ScanFileProvider>();

  @override
  Future<String> getIdScanFile({required File file}) async {
    return await _scanFileProvider.getIdScanFile(file: file);
  }
}
