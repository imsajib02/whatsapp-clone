part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class OnNavItemTap extends HomeEvent {
  final int index;
  OnNavItemTap(this.index);
}
