import 'package:virusscanapp/src/data/models/file/file_info_model.dart';

class Meta {
  FileInfo? fileInfo;

  Meta({this.fileInfo});

  Meta.fromJson(Map<String, dynamic> json) {
    fileInfo =
        json['file_info'] != null ? FileInfo.fromJson(json['file_info']) : null;
  }
}
