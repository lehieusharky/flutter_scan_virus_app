import 'package:virusscanapp/src/data/models/analysis_report/attributes.dart';

class Data {
  Attributes? attributes;
  String? id;

  Data({
    this.attributes,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    id = json['id'] ?? "";
  }
}
