import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:virusscanapp/src/data/repositories/remote/scan_file_repo.dart';

part 'scan_file_event.dart';
part 'scan_file_state.dart';

class ScanFileBloc extends Bloc<ScanFileEvent, ScanFileState> {
  ScanFileRepository scanFileRepository = GetIt.I.get<ScanFileRepository>();
  ScanFileBloc() : super(ScanFileInitial()) {
    on<ScanFileGetId>(_getId);
  }

  Future<void> _getId(ScanFileGetId event, Emitter<ScanFileState> emit) async {
    try {
      String id = await scanFileRepository.getIdScanFile(file: event.file);
      emit(ScanFileGetIdSuccess(id: id));
    } catch (e) {
      emit(ScanFileError(message: e.toString()));
    }
  }
}
