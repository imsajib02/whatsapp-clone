import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../barrel/utils.dart';
import '../../../main.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final _myPref = getIt<MyPref>();

  SplashBloc() : super(SplashState()) {
    on<OnStart>(_getAuthUser);
  }

  Future<void> _getAuthUser(SplashEvent event, Emitter<SplashState> emit) async {

    emit(state.copyWith(status: AuthStatus.initial));

    await Future.delayed(Duration(milliseconds: 3000));

    authUser = await _myPref.getAuthUser();

    if(authUser == null) {
      emit(state.copyWith(status: AuthStatus.unauthorized));
      return;
    }

    emit(state.copyWith(status: AuthStatus.authorized));
  }
}
