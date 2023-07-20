import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/summary_model.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/summary/widgets/chart_summary.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/summary/widgets/count_error.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/summary/widgets/notification_text.dart';
import 'package:virusscanapp/src/theme/font_theme.dart';

class SummarySection extends StatefulWidget {
  final SummaryModel status;

  const SummarySection({super.key, required this.status});

  @override
  State<SummarySection> createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  final List<SummaryModel> _listStatus = [];

  @override
  void initState() {
    super.initState();
    _listStatus.add(widget.status);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ShowMaliciousWidget(malicious: widget.status.getMalicious),
        SizedBox(
          height: 400.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CountErrorWidget(
                malicious: widget.status.getMalicious,
                total: widget.status.getTotal,
              ),
              ChartSummaryWidget(listStatus: _listStatus),
            ],
          ),
        ),
        Text(
          widget.status.datetime,
          style: FontTheme.shark15W500Inter,
        ),
      ],
    );
  }
}
