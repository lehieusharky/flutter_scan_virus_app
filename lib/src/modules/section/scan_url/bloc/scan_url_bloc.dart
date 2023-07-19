import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:virusscanapp/src/data/repositories/remote/scan_url_repo.dart';

part 'scan_url_event.dart';

part 'scan_url_state.dart';

class ScanUrlBloc extends Bloc<ScanUrlEvent, ScanUrlState> {
  ScanUrlRepository scanUrlRepository = GetIt.I.get<ScanUrlRepository>();

  ScanUrlBloc() : super(ScanUrlInitial()) {
    on<ScanUrlGetId>(_getId);
  }

  Future<void> _getId(ScanUrlGetId event, Emitter<ScanUrlState> emit) async {
    try {
      final String id = await scanUrlRepository.getIdScanUrl(url: event.url);
      emit(ScanUrlGetIdSuccess(id: id));
    } catch (e) {
      emit(ScanUrlError(message: e.toString()));
    }
  }
}
