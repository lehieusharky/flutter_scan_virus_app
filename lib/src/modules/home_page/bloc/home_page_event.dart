part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomePageGetBack extends HomePageEvent {}

class HomePageGetAnalysisReport extends HomePageEvent {
  final String id;

  const HomePageGetAnalysisReport({required this.id});

  @override
  List<Object> get props => [id];
}

class HomePageGetIpAddressAnalysisReport extends HomePageEvent {
  final String ipAddress;

  const HomePageGetIpAddressAnalysisReport({required this.ipAddress});

  @override
  List<Object> get props => [ipAddress];
}
