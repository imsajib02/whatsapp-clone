part of 'splash_bloc.dart';

class SplashState extends Equatable {

  final AuthStatus status;

  SplashState({this.status = AuthStatus.initial});

  @override
  List<Object?> get props => [status];

  SplashState copyWith({AuthStatus? status}) {

    return SplashState(
      status: status ?? this.status,
    );
  }
}
