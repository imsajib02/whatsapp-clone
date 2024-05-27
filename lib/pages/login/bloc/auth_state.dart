part of 'auth_bloc.dart';

class AuthState extends Equatable {

  final AuthStatus status;

  AuthState({this.status = AuthStatus.initial});

  @override
  List<Object?> get props => [status];

  AuthState copyWith({AuthStatus? status}) {

    return AuthState(
      status: status ?? this.status,
    );
  }
}