import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:virusscanapp/src/data/models/analysis_report/analysis_report_model.dart';
import 'package:virusscanapp/src/data/repositories/remote/get_analysis_report_repo.dart';

part 'analysis_report_event.dart';

part 'analysis_report_state.dart';

class AnalysisReportBloc
    extends Bloc<AnalysisReportEvent, AnalysisReportState> {
  GetAnalysisReportRepository getAnalysisReportRepository =
      GetIt.I.get<GetAnalysisReportRepository>();

  AnalysisReportBloc() : super(AnalysisReportInitial()) {
    on<AnalysisReportGetResult>(_getAnalysisReport);
  }

  Future<void> _getAnalysisReport(
      AnalysisReportGetResult event, Emitter<AnalysisReportState> emit) async {
    try {
      final AnalysisReportModel analysisReportModel =
          await getAnalysisReportRepository.getAnalysisReport(id: event.id);
      emit(AnalysisReportGetResultSuccess(
          analysisReportModel: analysisReportModel));
    } catch (e) {
      emit(AnalysisReportError(message: e.toString()));
    }
  }
}
