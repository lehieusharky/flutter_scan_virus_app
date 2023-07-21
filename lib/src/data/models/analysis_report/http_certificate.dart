class HttpCertificate {
  LastHttpsCertificate? lastHttpsCertificate;

  HttpCertificate({this.lastHttpsCertificate});


}

class LastHttpsCertificate {
  PublicKey? publicKey;
  String? thumbprintSha256;
  String? thumbprint;
  Extensions? extensions;
  CertSignature? certSignature;
  String? serialNumber;
  int? size;

  LastHttpsCertificate({
    this.publicKey,
    this.thumbprintSha256,
    this.thumbprint,
    this.extensions,
    this.certSignature,
    this.serialNumber,
    this.size,
  });

  LastHttpsCertificate.fromJson(Map<String, dynamic> json) {
    publicKey = json['public_key'] != null
        ? PublicKey.fromJson(json['public_key'])
        : null;
    thumbprintSha256 = json['thumbprint_sha256'];
    thumbprint = json['thumbprint'];
    extensions = json['extensions'] != null
        ? Extensions.fromJson(json['extensions'])
        : null;
    certSignature = json['cert_signature'] != null
        ? CertSignature.fromJson(json['cert_signature'])
        : null;
    serialNumber = json['serial_number'];
    size = json['size'];
  }
}

class PublicKey {
  String? algorithm;
  Ec? ec;

  PublicKey({this.algorithm, this.ec});

  PublicKey.fromJson(Map<String, dynamic> json) {
    algorithm = json['algorithm'];
    ec = json['ec'] != null ? Ec.fromJson(json['ec']) : null;
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

  Validity({this.notAfter, this.notBefore});

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
  List<String>? crlDistributionPoints;
  List<String>? keyUsage;

  Extensions({
    this.certificatePolicies,
    this.extendedKeyUsage,
    this.caInformationAccess,
    this.subjectKeyIdentifier,
    this.crlDistributionPoints,
    this.keyUsage,
  });

  Extensions.fromJson(Map<String, dynamic> json) {
    certificatePolicies = json['certificate_policies'].cast<String>();
    extendedKeyUsage = json['extended_key_usage'].cast<String>();
    caInformationAccess = json['ca_information_access'] != null
        ? CaInformationAccess.fromJson(json['ca_information_access'])
        : null;
    subjectKeyIdentifier = json['subject_key_identifier'];
    crlDistributionPoints = json['crl_distribution_points'].cast<String>();
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

class CertSignature {
  String? signatureAlgorithm;
  String? signature;

  CertSignature({this.signatureAlgorithm, this.signature});

  CertSignature.fromJson(Map<String, dynamic> json) {
    signatureAlgorithm = json['signature_algorithm'];
    signature = json['signature'];
  }
}
