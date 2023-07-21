import 'package:virusscanapp/src/data/models/analysis_report/file_info.dart';
import 'package:virusscanapp/src/data/models/analysis_report/http_certificate.dart';
import 'package:virusscanapp/src/data/models/analysis_report/url_info.dart';

class DetailModel {
  final FileInfo? fileInfo;
  final UrlInfo? urlInfo;
  final HttpCertificate? httpCertificate;

  DetailModel({
    this.urlInfo,
    this.fileInfo,
    this.httpCertificate,
  });
}
