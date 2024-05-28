part of 'home_bloc.dart';

class HomeState extends Equatable {

  final int currentIndex;
  final String headerLocaleKey;

  HomeState({this.currentIndex = 0, this.headerLocaleKey = 'app_name'});

  @override
  List<Object?> get props => [currentIndex, headerLocaleKey];

  HomeState copyWith({int? currentIndex, String? headerLocaleKey}) {

    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      headerLocaleKey: headerLocaleKey ?? this.headerLocaleKey,
    );
  }
}