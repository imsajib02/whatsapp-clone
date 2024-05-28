import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import '../../../barrel/utils.dart';
import '../../../barrel/models.dart' as auth;
import '../../../main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final _myPref = getIt<MyPref>();
  final _dbRef = FirebaseDatabase.instance.ref().child(dotenv.env['FIREBASE_DB']!).child(dotenv.env['TABLE_USERS']!);

  AuthBloc() : super(AuthState()) {
    on<SignInWithGoogle>(_signInWithGoogle);
  }

  Future<void> _signInWithGoogle(AuthEvent event, Emitter<AuthState> emit) async {

    emit(state.copyWith(status: AuthStatus.initial));

    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await user?.authentication;

      emit(state.copyWith(status: AuthStatus.loading));

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      authUser = auth.User(
        id: userCredential.user?.uid,
        name: userCredential.user?.displayName,
        email: userCredential.user?.email,
        phone: userCredential.user?.phoneNumber,
        photoUrl: userCredential.user?.photoURL,
      );

      _myPref.saveAuthUser(authUser!);

      DatabaseEvent event = await _dbRef.orderByChild('email').equalTo(authUser?.email).once();

      if(event.snapshot.value != null) {
        emit(state.copyWith(status: AuthStatus.authorized));
        return;
      }

      await _dbRef.push().set(authUser?.toJson()).then((_) async {
        emit(state.copyWith(status: AuthStatus.authorized));
      }).catchError((error) async {
        emit(state.copyWith(status: AuthStatus.failure));
      });

    } on Exception {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }
}