class HttpCertificate {
  String? thumbprintSha256;
  String? thumbprint;
  Extensions? extensions;
  String? serialNumber;
  int? size;

  HttpCertificate({
    this.thumbprintSha256,
    this.thumbprint,
    this.extensions,
    this.serialNumber,
    this.size,
  });

  HttpCertificate.fromJson(Map<String, dynamic> json) {
    thumbprintSha256 = json['thumbprint_sha256'];
    thumbprint = json['thumbprint'];
    extensions = json['extensions'] != null
        ? Extensions.fromJson(json['extensions'])
        : null;
    serialNumber = json['serial_number'];
    size = json['size'];
  }
}

class Ec {
  String? oid;
  String? pub;

  Ec({this.oid, this.pub});

  Ec.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    pub = json['pub'];
  }
}

class Validity {
  String? notAfter;
  String? notBefore;

  Validity({
    this.notAfter,
    this.notBefore,
  });

  Validity.fromJson(Map<String, dynamic> json) {
    notAfter = json['not_after'];
    notBefore = json['not_before'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['not_after'] = notAfter;
    data['not_before'] = notBefore;
    return data;
  }
}

class Extensions {
  List<String>? certificatePolicies;
  List<String>? extendedKeyUsage;
  CaInformationAccess? caInformationAccess;
  String? subjectKeyIdentifier;
  List<String>? keyUsage;

  Extensions({
    this.certificatePolicies,
    this.extendedKeyUsage,
    this.caInformationAccess,
    this.subjectKeyIdentifier,
    this.keyUsage,
  });

  Extensions.fromJson(Map<String, dynamic> json) {
    certificatePolicies = json['certificate_policies'].cast<String>();
    extendedKeyUsage = json['extended_key_usage'].cast<String>();
    caInformationAccess = json['ca_information_access'] != null
        ? CaInformationAccess.fromJson(json['ca_information_access'])
        : null;
    subjectKeyIdentifier = json['subject_key_identifier'];
    keyUsage = json['key_usage'].cast<String>();
  }
}

class CaInformationAccess {
  String? cAIssuers;
  String? oCSP;

  CaInformationAccess({this.cAIssuers, this.oCSP});

  CaInformationAccess.fromJson(Map<String, dynamic> json) {
    cAIssuers = json['CA Issuers'];
    oCSP = json['OCSP'];
  }
}
