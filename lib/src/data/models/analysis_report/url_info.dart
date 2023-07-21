class UrlInfo {
  String? url;
  String? id;

  UrlInfo({this.url, this.id});

  UrlInfo.fromJson(Map<String, dynamic> json) {
    url = json['url'] ?? "unknown";
    id = json['id'] ?? "unknown";
  }
}
