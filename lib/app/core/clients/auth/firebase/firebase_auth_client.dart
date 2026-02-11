import 'package:chaty_app/app/core/clients/auth/auth_client.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthClient implements AuthClient {
  final FirebaseAuth firebaseInstance;

  FirebaseAuthClient() : firebaseInstance = FirebaseAuth.instance;

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw GenericException(message: "A senha fornecida é muito fraca");
      } else if (e.code == 'email-already-in-use') {
        throw GenericException(message: "A conta já existe para esse e-mail.");
      }
      throw GenericException(
        message: "Ocorreu um erro inesperado ao tentar criar a conta",
      );
    } catch (e) {
      throw GenericException(
        message: "Ocorreu um erro inesperado ao tentar criar a conta",
      );
    }
  }

  @override
  Future<UserCredential> authWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == "invalid-credential") {
        throw GenericException(message: "Email ou senha inválidos!");
      } else if (e.code == 'wrong-password') {
        throw GenericException(message: "Email ou senha inválidos!");
      }
      throw GenericException(message: "Ocorreu um erro inesperado ao realizar a autenticação");
    }
  }
  
  @override
  Future<void> updateUserDisplayName({required String newName}) async{
    final user = FirebaseAuth.instance.currentUser;
    await user?.updateDisplayName(newName);
    await user?.reload();
  }
}
