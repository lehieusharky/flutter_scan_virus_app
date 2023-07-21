import 'package:virusscanapp/src/data/models/analysis_report/file_info.dart';
import 'package:virusscanapp/src/data/models/analysis_report/url_info.dart';

class Meta {
  FileInfo? fileInfo;
  UrlInfo? urlInfo;

  Meta({
    this.fileInfo,
    this.urlInfo,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    fileInfo =
        json['file_info'] != null ? FileInfo.fromJson(json['file_info']) : null;
    urlInfo =
        json['url_info'] != null ? UrlInfo.fromJson(json['url_info']) : null;
  }
}
