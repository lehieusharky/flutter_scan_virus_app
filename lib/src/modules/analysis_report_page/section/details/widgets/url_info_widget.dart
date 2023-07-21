import 'package:flutter/material.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/data/models/analysis_report/url_info.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/detail_item.dart';

class UrlInfoWidget extends StatelessWidget {
  final UrlInfo? urlInfo;

  const UrlInfoWidget({
    super.key,
    this.urlInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailItem(
          title: TextConstant.url,
          value: urlInfo!.url!,
        ),
        DetailItem(
          title: TextConstant.id,
          value: urlInfo!.id!,
        ),
      ],
    );
  }
}
