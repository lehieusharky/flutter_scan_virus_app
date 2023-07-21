part of 'scan_file_bloc.dart';

abstract class ScanFileEvent extends Equatable {
  const ScanFileEvent();

  @override
  List<Object> get props => [];
}

class ScanFileGetId extends ScanFileEvent {
  final File file;

  const ScanFileGetId({required this.file});

  @override
  List<Object> get props => [file];
}