part of 'my_app_bloc.dart';

abstract class MyAppEvent extends Equatable {
  const MyAppEvent();
  @override
  List<Object> get props => [];
}

class MyAppUpdateLanguage extends MyAppEvent {}

class MyAppGetDefaultLanguage extends MyAppEvent {}
