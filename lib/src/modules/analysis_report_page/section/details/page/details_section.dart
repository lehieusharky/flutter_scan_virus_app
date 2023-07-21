import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/detail_model.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/file_info_widget.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/ip_address_widget.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/url_info_widget.dart';

class DetailsSection extends StatelessWidget {
  final DetailModel detail;

  const DetailsSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          if (detail.fileInfo != null) ...[
            FileInfoWidget(fileInfo: detail.fileInfo)
          ] else if ((detail.urlInfo != null)) ...[
            UrlInfoWidget(urlInfo: detail.urlInfo)
          ] else ...[
            IpAddressWidget(httpCertificate: detail.httpCertificate)
          ]
        ],
      ),
    );
  }
}
