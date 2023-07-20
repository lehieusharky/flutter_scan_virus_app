part of 'analysis_report_bloc.dart';

abstract class AnalysisReportEvent extends Equatable {
  const AnalysisReportEvent();

  @override
  List<Object> get props => [];
}

class AnalysisReportGetResult extends AnalysisReportEvent {
  final String id;

  const AnalysisReportGetResult({required this.id});

  @override
  List<Object> get props => [id];
}
