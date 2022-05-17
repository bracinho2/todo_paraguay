import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthentication {
  Future<bool> checkLogin();
  Future<bool> currentUser();
  Future<void> logout();
}

class AuthenticationImpl implements IAuthentication {
  final FirebaseAuth _firebaseAuth;
  User? loggedUser;

  AuthenticationImpl(this._firebaseAuth);
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
    //checkLogin();
  }

  @override
  Future<bool> currentUser() async {
    var result = _firebaseAuth.currentUser;
    if (result == null) {
      print('AUTH STORE INFORM -> ' 'Não exite usuário logado!');
      return false;
    } else {
      loggedUser = result;
      print('AUTH STORE INFORM -> ' + loggedUser.toString());
      return true;
    }
  }
}
