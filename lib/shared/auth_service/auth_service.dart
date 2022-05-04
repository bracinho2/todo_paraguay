import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  User? user;
  bool isLoading = true;

  AuthService(this._firebaseAuth) {
    _authCheck();
  }

  _authCheck() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      user = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();

      if (user == null) {
        print('Usuário não está logado! =(');
      } else {
        print('Usuario logado: ' + user.toString());
      }
    });
  }

  _getUser() {
    user = _firebaseAuth.currentUser;
    notifyListeners();
  }

  register({required String email, required String password}) async {
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

  login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      _getUser();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (error.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente.');
      }
    }
  }

  logout() async {
    _firebaseAuth.signOut();
    _getUser();
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
