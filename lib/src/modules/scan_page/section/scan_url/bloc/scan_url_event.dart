part of 'scan_url_bloc.dart';

abstract class ScanUrlEvent extends Equatable {
  const ScanUrlEvent();
  @override
  List<Object> get props => [];
}

class ScanUrlGetId extends ScanUrlEvent {
  final String url;

  const ScanUrlGetId({required this.url});
  @override
  List<Object> get props => [url];
}
