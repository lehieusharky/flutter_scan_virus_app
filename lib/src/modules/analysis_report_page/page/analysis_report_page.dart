import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/data/models/detail_model.dart';
import 'package:virusscanapp/src/data/models/detection_model.dart';
import 'package:virusscanapp/src/data/models/summary_model.dart';
import 'package:virusscanapp/src/l10n/app_localizations.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/bloc/analysis_report_bloc.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/details/page/details_section.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/detection/page/detection_section.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/section/summary/page/summary_section.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';
import 'package:virusscanapp/src/widgets/custom_arrow_back.dart';
import 'package:virusscanapp/src/widgets/custom_tab_bar.dart';
import 'package:virusscanapp/src/widgets/custom_tab_bar_child.dart';

class AnalysisReportPage extends StatefulWidget {
  final String id;

  const AnalysisReportPage({
    super.key,
    required this.id,
  });

  @override
  State<AnalysisReportPage> createState() => _AnalysisReportPageState();
}

class _AnalysisReportPageState extends State<AnalysisReportPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  AnalysisReportModel analysisReportModel = AnalysisReportModel();

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
    return BlocProvider(
      create: (context) =>
          AnalysisReportBloc()..add(AnalysisReportGetResult(id: widget.id)),
      child: BlocConsumer<AnalysisReportBloc, AnalysisReportState>(
        listener: (context, state) {
          if (state is AnalysisReportGetResultSuccess) {
            analysisReportModel = state.analysisReportModel;
          }
        },
        builder: (context, state) {
          if (state is AnalysisReportGetResultSuccess) {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 60.h),
                  const CustomArrowBackIcon(),
                  SizedBox(height: 20.h),
                  CustomTabBar(
                    tabController: _tabController,
                    tabs: [
                      CustomTabChild(
                          title: AppLocalizations.of(context)!.summary),
                      CustomTabChild(
                          title: AppLocalizations.of(context)!.detection),
                      CustomTabChild(
                          title: AppLocalizations.of(context)!.details),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SummarySection(
                          status: SummaryModel(
                            status: analysisReportModel.getStatus,
                            datetime: analysisReportModel.getDateTime,
                          ),
                        ),
                        DetectionSection(
                          detection: DetectionModel(
                              listAnalysisResult:
                                  analysisReportModel.getListAnalysisResult),
                        ),
                        DetailsSection(
                            detail: DetailModel(
                                fileInfo: analysisReportModel.getFileInfo))
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: LinearProgressIndicator(
                  color: ColorTheme.scienceBlue,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
