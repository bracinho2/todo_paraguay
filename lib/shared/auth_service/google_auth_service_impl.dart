import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service_interface.dart';

class GoogleAuth implements IAuthService {
  User? loggedUser;
  final FirebaseAuth _firebaseAuth;

  GoogleAuth(this._firebaseAuth);

  get user => loggedUser;

  authCheck(BuildContext context) {
    _firebaseAuth.authStateChanges().listen((User? user) {
      loggedUser = (user == null) ? null : user;

      if (loggedUser == null) {
        print('Usuário não está logado! =(((');
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (_) => LoginPageAuth()));
      } else {
        print('Usuario logado: ' + user.toString());
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const ProductHomePageBloc()));
      }
    });
  }

  _getUser() {
    loggedUser = _firebaseAuth.currentUser;
  }

  @override
  void register({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      _getUser();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (error.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  @override
  void login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      _getUser();

      if (loggedUser != null) {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (_) => const ProductHomePageBloc()));
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (error.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente.');
      }
    }
  }

  @override
  void logout({required BuildContext context}) {
    _firebaseAuth.signOut();
    authCheck(context);
  }
}
