part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class OnImagePickerTypeSelected extends ProfileEvent {
  final ImageSource source;
  OnImagePickerTypeSelected(this.source);
}
