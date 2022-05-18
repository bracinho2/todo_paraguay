import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_paraguay/shared/hard_debug/app_hard_debug.dart';
import 'package:todo_paraguay/src/login_email/domain/entities/logged_user_info.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/get_logged_user.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/logout.dart';

abstract class IAuthentication {
  Future<bool> currentUser();
  Future<void> logout();
  setUser(LoggedUserInfo? user);
}

class AuthenticationImpl implements IAuthentication {
  var loggedUser;
  final IGetLoggedUser _iGetLoggedUser;
  final ILogout _iLogout;

  AuthenticationImpl(this._iGetLoggedUser, this._iLogout);

  @override
  Future<void> logout() async {
    _iLogout.call();
    setUser(null);
  }

  @override
  Future<bool> currentUser() async {
    var result = await _iGetLoggedUser.call();
    return result.fold((l) => false, (user) {
      setUser(user);
      return true;
    });
  }

  @override
  setUser(LoggedUserInfo? user) => loggedUser = user;
}
