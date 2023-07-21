part of 'scan_file_bloc.dart';

abstract class ScanFileState extends Equatable {
  const ScanFileState();

  @override
  List<Object> get props => [];
}

class ScanFileInitial extends ScanFileState {}

class ScanFileLoading extends ScanFileState {}

class ScanFileGetIdSuccess extends ScanFileState {
  final String id;

  const ScanFileGetIdSuccess({required this.id});

  @override
  List<Object> get props => [id];
}

class ScanFileError extends ScanFileState {
  final String message;

  const ScanFileError({required this.message});

  @override
  List<Object> get props => [message];
}
