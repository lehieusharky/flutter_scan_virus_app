class FileInfo {
  int? size;
  String? sha1;
  String? sha256;
  String? md5;

  FileInfo({
    this.size,
    this.sha1,
    this.sha256,
    this.md5,
  });

  FileInfo.fromJson(Map<String, dynamic> json) {
    size = json['size'] ?? 0;
    sha1 = json['sha1'] ?? "unknown";
    sha256 = json['sha256'] ?? "unknown";
    md5 = json['md5'] ?? "unknown";
  }
}
