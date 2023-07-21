import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/detail_model.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/detail_item.dart';

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
            DetailItem(
              title: 'URL',
              value: widget.detail.urlInfo!.url!,
            ),
            DetailItem(title: 'ID', value: widget.detail.urlInfo!.id!),
          ] else if ((widget.detail.urlInfo != null)) ...[
            DetailItem(
                title: 'Size', value: widget.detail.fileInfo!.size.toString()),
            DetailItem(title: 'Sha1', value: widget.detail.fileInfo!.sha1!),
            DetailItem(title: 'Sha256', value: widget.detail.fileInfo!.sha256!),
            DetailItem(title: 'Md5', value: widget.detail.fileInfo!.md5!),
          ] else ...[
            const Text('hello')
          ]
        ],
      ),
    );
  }
}
