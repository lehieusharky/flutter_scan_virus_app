import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

abstract class FilePickerProvider {
  Future<File> getSingleFile();
}

@Injectable(as: FilePickerProvider)
class FilePickerProviderImpl extends FilePickerProvider {
  @override
  Future<File> getSingleFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      File file = File(result!.files.single.path!);
      return file;
    } catch (e) {
      throw Exception(e);
    }
  }
}
