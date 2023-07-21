import 'package:flutter/material.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/data/models/detail_model.dart';
import 'package:virusscanapp/src/data/models/detection_model.dart';
import 'package:virusscanapp/src/data/models/summary_model.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/page/details_section.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/detection/page/detection_section.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/summary/page/summary_section.dart';
import 'package:virusscanapp/src/widgets/custom_tab_bar.dart';
import 'package:virusscanapp/src/widgets/custom_tab_bar_child.dart';

class AnalysisReportPage extends StatefulWidget {
  final AnalysisReportModel analysisReportModel;

  const AnalysisReportPage({
    super.key,
    required this.analysisReportModel,
  });

  @override
  State<AnalysisReportPage> createState() => _AnalysisReportPageState();
}

class _AnalysisReportPageState extends State<AnalysisReportPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTabBar(
            tabController: _tabController,
            tabs: [
              CustomTabChild(title: AppLocalizations.of(context)!.summary),
              CustomTabChild(title: AppLocalizations.of(context)!.detection),
              CustomTabChild(title: AppLocalizations.of(context)!.details),
            ],
          ),
          Expanded(
            child: _buildBody(),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        SummarySection(
          status: SummaryModel(
            status: widget.analysisReportModel.getStatus,
            datetime: widget.analysisReportModel.getDateTime,
          ),
        ),
        DetectionSection(
          detection: DetectionModel(
              listAnalysisResult:
                  widget.analysisReportModel.getListAnalysisResult),
        ),
        DetailsSection(
            detail: DetailModel(
          fileInfo: widget.analysisReportModel.getFileInfo,
          urlInfo: widget.analysisReportModel.getUrlInfo,
        ))
      ],
    );
  }
}
