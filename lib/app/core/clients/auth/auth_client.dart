import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthClient {
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserCredential> authWithEmailAndPassword({required String email, required String password});

  Future<void> updateUserDisplayName({required String newName});

  Future<void> logout();
}
