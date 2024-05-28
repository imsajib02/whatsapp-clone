import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../barrel/utils.dart';
import '../../../main.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final _myPref = getIt<MyPref>();
  final ImagePicker _imagePicker = ImagePicker();

  final _databaseReference = FirebaseDatabase.instance.ref().child(dotenv.env['FIREBASE_DB']!).child(dotenv.env['TABLE_USERS']!);
  final _storageReference = FirebaseStorage.instance.ref().child(dotenv.env['FIREBASE_DB']!).child(dotenv.env['STORAGE_AVATAR']!);

  ProfileBloc() : super(ProfileState()) {
    on<OnImagePickerTypeSelected>(_pickImage);
  }

  Future<void> _pickImage(OnImagePickerTypeSelected event, Emitter<ProfileState> emit) async {

    final XFile? xFile = await _imagePicker.pickImage(
      source: event.source,
      imageQuality: 60,
    );

    if(xFile == null) return;

    TaskSnapshot taskSnapshot = await _storageReference.child(authUser!.ObjKey!).putFile(File(xFile.path));

    if(taskSnapshot.state != TaskState.success) {
      //emit(state.copyWith(message: Strings.failedToUploadProfileImage, responseStatus: ResponseStatus.failed));
      return;
    }

    String avatarUrl = await taskSnapshot.ref.getDownloadURL();

    await _databaseReference.child(authUser!.ObjKey!).update({'photoUrl': avatarUrl}).then((_) async {

      authUser?.photoUrl = avatarUrl;
      _myPref.saveAuthUser(authUser!);

      //emit(state.copyWith(responseStatus: ResponseStatus.success));
    }).catchError((error) async {
      //emit(state.copyWith(responseStatus: ResponseStatus.failed));
    });
  }
}
