part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageGetBackSuccess extends HomePageState {}

class HomePageGetAnalysisSuccess extends HomePageState {
  final AnalysisReportModel analysisReport;

  const HomePageGetAnalysisSuccess({required this.analysisReport});

  @override
  List<Object> get props => [analysisReport];
}

class HomePageError extends HomePageState {
  final String message;

  const HomePageError({required this.message});
  @override
  List<Object> get props => [message];
}
