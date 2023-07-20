import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/detail_model.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

import '../widgets/detail_item.dart';

class DetailsSection extends StatelessWidget {
  final DetailModel detail;

  const DetailsSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          DetailItem(title: 'Size',value: detail.fileInfo.size.toString()),
          DetailItem(title: 'Sha1',value: detail.fileInfo.sha1!),
          DetailItem(title: 'Sha256',value: detail.fileInfo.sha256!),
          DetailItem(title: 'Md5',value: detail.fileInfo.md5!),
        ],
      ),
    );
  }
}
