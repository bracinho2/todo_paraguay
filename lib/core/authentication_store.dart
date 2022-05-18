import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_paraguay/shared/hard_debug/app_hard_debug.dart';

abstract class IAuthentication {
  Future<bool> currentUser();
  Future<void> logout();
  setUser(User user);
}

class AuthenticationImpl implements IAuthentication {
  final FirebaseAuth _firebaseAuth;
  User? loggedUser;

  AuthenticationImpl(this._firebaseAuth);

  @override
  Future<void> logout() async {
    _firebaseAuth.signOut();
    setUser(null);
  }

  @override
  Future<bool> currentUser() async {
    var result = _firebaseAuth.currentUser;
    if (result == null) {
      print('AUTH STORE INFORM -> ' 'Não existe usuário logado!');
      return false;
    } else {
      loggedUser = result;
      HardDebug().loggedUserInfo(loggedUser);
      return true;
    }
  }

  @override
  setUser(User? user) => loggedUser = user;
}
