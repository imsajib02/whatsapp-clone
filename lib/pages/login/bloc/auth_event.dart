part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInWithGoogle extends AuthEvent {}