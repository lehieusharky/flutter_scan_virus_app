import 'package:virusscanapp/src/data/models/analysis_report/file_info.dart';
import 'package:virusscanapp/src/data/models/analysis_report/url_info.dart';

class DetailModel {
  final FileInfo? fileInfo;
  final UrlInfo? urlInfo;

  DetailModel({
    this.urlInfo,
    this.fileInfo,
  });
}
