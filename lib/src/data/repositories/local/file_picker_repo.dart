import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:virusscanapp/src/data/providers/local/file_picker_provider.dart';

abstract class FilePickerRepository {
  Future<File> getSingleFile();
}

@Injectable(as: FilePickerRepository)
class FilePickerRepositoryImpl extends FilePickerRepository {
  final FilePickerProvider _filePickerProvider =
      GetIt.I.get<FilePickerProvider>();
  @override
  Future<File> getSingleFile() async {
    return await _filePickerProvider.getSingleFile();
  }
}
