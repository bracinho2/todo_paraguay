import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthStore {
  Future<bool> checkLogin();
  Future<bool> currentUser();
  Future<void> logout();
}

class AuthStoreImpl implements IAuthStore {
  final FirebaseAuth _firebaseAuth;
  User? loggedUser;

  AuthStoreImpl(this._firebaseAuth);
  @override
  Future<bool> checkLogin() async {
    var isLogged;

    _firebaseAuth.authStateChanges().listen((User? user) {
      loggedUser = (user == null) ? null : user;

      if (loggedUser == null) {
        print('AUTH STORE INFORM -> Usuário não está logado!');
        isLogged = false;
      } else {
        print('AUTH STORE INFORM -> ' + user.toString());
        isLogged = true;
        print(isLogged);
      }
    });

    return isLogged;
  }

  @override
  Future<void> logout() async {
    _firebaseAuth.signOut();
    checkLogin();
  }

  @override
  Future<bool> currentUser() async {
    loggedUser = _firebaseAuth.currentUser;
    if (loggedUser == null) {
      return false;
    } else {
      return true;
    }
  }
}
