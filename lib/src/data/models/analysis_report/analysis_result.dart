class AnalysisResult {
  String? category;
  String? engineName;
  String? engineVersion;
  String? method;
  String? engineUpdate;

  AnalysisResult({
    this.category,
    this.engineName,
    this.engineVersion,
    this.method,
    this.engineUpdate,
  });

  AnalysisResult.fromJson(Map<String, dynamic> json) {
    category = json['category'] ?? "unknown";
    engineName = json['engine_name'] ?? "unknown";
    engineVersion = json['engine_version'] ?? "unknown";
    method = json['method'] ?? "unknown";
    engineUpdate = json['engine_update'] ?? "unknown";
  }
}
