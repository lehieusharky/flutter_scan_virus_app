import 'package:flutter/material.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/data/models/analysis_report/http_certificate.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/detail_item.dart';

class IpAddressWidget extends StatelessWidget {
  final HttpCertificate? httpCertificate;

  const IpAddressWidget({
    super.key,
    this.httpCertificate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailItem(
          title: TextConstant.serialNumber,
          value: httpCertificate!.serialNumber!,
        ),
        DetailItem(
          title: TextConstant.thumbPrintSha256,
          value: httpCertificate!.thumbprintSha256!,
        ),
        DetailItem(
          title: TextConstant.thumbPrint,
          value: httpCertificate!.thumbprint!,
        ),
        DetailItem(
          title: TextConstant.cAIssuers,
          value: httpCertificate!.extensions!.caInformationAccess!.cAIssuers!,
        ),
        DetailItem(
          title: TextConstant.oCSP,
          value: httpCertificate!.extensions!.caInformationAccess!.oCSP!,
        ),
        DetailItem(
          title: TextConstant.keyUsage,
          value: httpCertificate!.extensions!.keyUsage![0],
        ),
      ],
    );
  }
}
