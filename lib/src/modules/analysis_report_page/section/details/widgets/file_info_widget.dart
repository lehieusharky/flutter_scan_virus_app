import 'package:flutter/material.dart';
import 'package:virusscanapp/src/constants/text_constant.dart';
import 'package:virusscanapp/src/data/models/analysis_report/file_info.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/widgets/detail_item.dart';

class FileInfoWidget extends StatelessWidget {
  final FileInfo? fileInfo;

  const FileInfoWidget({
    super.key,
    this.fileInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailItem(
          title: TextConstant.size,
          value: fileInfo!.size.toString(),
        ),
        DetailItem(
          title: TextConstant.sha1,
          value: fileInfo!.sha1!,
        ),
        DetailItem(
          title: TextConstant.sha256,
          value: fileInfo!.sha256!,
        ),
        DetailItem(
          title: TextConstant.md5,
          value: fileInfo!.md5!,
        ),
      ],
    );
  }
}
