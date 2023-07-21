import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/data/repositories/remote/get_analysis_report_repo.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  GetAnalysisReportRepository getAnalysisReportRepository =
      GetIt.I.get<GetAnalysisReportRepository>();

  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageGetAnalysisReport>(_getAnalysisReport);
    on<HomePageGetBack>(_getBack);
    on<HomePageGetIpAddressAnalysisReport>(_getIpAddressAnalysisReport);
  }

  Future<void> _getIpAddressAnalysisReport(
      HomePageGetIpAddressAnalysisReport event,
      Emitter<HomePageState> emit) async {
    emit(HomePageLoading());
    try {
      final AnalysisReportModel analysisReportModel =
          await getAnalysisReportRepository.getIpAddressAnalysisReport(
              ipAddress: event.ipAddress);
      emit(HomePageGetAnalysisSuccess(analysisReport: analysisReportModel));
    } catch (e) {
      emit(HomePageError(message: e.toString()));
    }
  }

  Future<void> _getAnalysisReport(
      HomePageGetAnalysisReport event, Emitter<HomePageState> emit) async {
    emit(HomePageLoading());
    try {
      final AnalysisReportModel analysisReportModel =
          await getAnalysisReportRepository.getAnalysisReport(id: event.id);
      emit(HomePageGetAnalysisSuccess(analysisReport: analysisReportModel));
    } catch (e) {
      emit(HomePageError(message: e.toString()));
    }
  }

  Future<void> _getBack(
      HomePageGetBack event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageGetBackSuccess());
    } catch (e) {
      emit(HomePageError(message: e.toString()));
    }
  }
}
