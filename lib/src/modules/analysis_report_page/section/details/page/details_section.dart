import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/detail_model.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/file_info_widget.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/ip_address_widget.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/url_info_widget.dart';

class DetailsSection extends StatefulWidget {
  final DetailModel detail;

  const DetailsSection({super.key, required this.detail});

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          if (widget.detail.fileInfo != null) ...[
            FileInfoWidget(fileInfo: widget.detail.fileInfo)
          ] else if ((widget.detail.urlInfo != null)) ...[
            UrlInfoWidget(urlInfo: widget.detail.urlInfo)
          ] else ...[
            IpAddressWidget(httpCertificate: widget.detail.httpCertificate)
          ]
        ],
      ),
    );
  }
}
