class Stats {
  int? harmless;
  int? typeUnsupported;
  int? suspicious;
  int? confirmedTimeout;
  int? timeout;
  int? failure;
  int? malicious;
  int? undetected;

  Stats({
    this.harmless,
    this.typeUnsupported,
    this.suspicious,
    this.confirmedTimeout,
    this.timeout,
    this.failure,
    this.malicious,
    this.undetected,
  });

  Stats.fromJson(Map<String, dynamic> json) {
    harmless = json['harmless'] ?? 0;
    typeUnsupported = json['type-unsupported'] ?? 0;
    suspicious = json['suspicious'] ?? 0;
    confirmedTimeout = json['confirmed-timeout'] ?? 0;
    timeout = json['timeout'] ?? 0;
    failure = json['failure'] ?? 0;
    malicious = json['malicious'] ?? 0;
    undetected = json['undetected'] ?? 0;
  }
}
