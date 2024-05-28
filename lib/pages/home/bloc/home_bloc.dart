import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeState()) {
    on<OnNavItemTap>(_updateHomeUI);
  }

  Future<void> _updateHomeUI(OnNavItemTap event, Emitter<HomeState> emit) async {

    String localeKey = '';

    switch(event.index) {

      case 0:
        localeKey = 'app_name';
        break;

      case 1:
        localeKey = 'updates';
        break;

      case 2:
        localeKey = 'communities';
        break;

      case 3:
        localeKey = 'calls';
        break;
    }

    emit(state.copyWith(currentIndex: event.index, headerLocaleKey: localeKey));
  }
}
