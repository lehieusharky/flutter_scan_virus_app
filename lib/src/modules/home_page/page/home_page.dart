import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/modules/analysis_report_page/page/analysis_report_page.dart';
import 'package:virusscanapp/src/modules/home_page/bloc/home_page_bloc.dart';
import 'package:virusscanapp/src/modules/home_page/widgets/change_language.dart';
import 'package:virusscanapp/src/modules/scan_page/page/scan_page.dart';
import 'package:virusscanapp/src/widgets/custom_app_bar.dart';
import 'package:virusscanapp/src/widgets/custom_arrow_back.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnalysisReportModel analysisReportModel = AnalysisReportModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state is HomePageError) {
            log(state.message);
          }
          if (state is HomePageGetAnalysisSuccess) {
            analysisReportModel = state.analysisReport;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              action: const [
                ChangeLanguageWidget(),
              ],
              leading: Builder(builder: (context) {
                if (state is HomePageGetAnalysisSuccess) {
                  return CustomArrowBackIcon(
                      onPressed: () =>
                          context.read<HomePageBloc>().add(HomePageGetBack()));
                }
                return const SizedBox();
              }),
            ),
            body: Builder(
              builder: (BuildContext context) {
                if (state is HomePageGetAnalysisSuccess) {
                  return AnalysisReportPage(
                      analysisReportModel: analysisReportModel);
                } else if (state is HomePageLoading) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: const Center(
                      child: LinearProgressIndicator(),
                    ),
                  );
                } else {
                  return const ScanPage();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
