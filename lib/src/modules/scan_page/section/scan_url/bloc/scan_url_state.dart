part of 'scan_url_bloc.dart';

abstract class ScanUrlState extends Equatable {
  const ScanUrlState();

  @override
  List<Object> get props => [];
}

class ScanUrlInitial extends ScanUrlState {}

class ScanUrlLoading extends ScanUrlState {}

class ScanUrlGetIdSuccess extends ScanUrlState {
  final String id;

  const ScanUrlGetIdSuccess({required this.id});

  @override
  List<Object> get props => [id];
}

class ScanUrlError extends ScanUrlState {
  final String message;

  const ScanUrlError({required this.message});
  @override
  List<Object> get props => [message];
}
