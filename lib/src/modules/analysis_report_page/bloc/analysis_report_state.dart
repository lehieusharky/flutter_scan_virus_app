part of 'analysis_report_bloc.dart';

abstract class AnalysisReportState extends Equatable {
  const AnalysisReportState();

  @override
  List<Object> get props => [];
}

class AnalysisReportInitial extends AnalysisReportState {}

class AnalysisReportGetResultSuccess extends AnalysisReportState {
  final AnalysisReportModel analysisReportModel;

  const AnalysisReportGetResultSuccess({required this.analysisReportModel});

  @override
  List<Object> get props => [analysisReportModel];
}

class AnalysisReportError extends AnalysisReportState {
  final String message;

  const AnalysisReportError({required this.message});

  @override
  List<Object> get props => [message];
}
