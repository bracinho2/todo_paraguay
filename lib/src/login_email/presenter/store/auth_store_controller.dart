import 'package:todo_paraguay/core/app_router.dart';
import 'package:todo_paraguay/core/authentication_store.dart';
import 'package:todo_paraguay/shared/snackbar_manager/snackbar_manager.dart';
import 'package:todo_paraguay/src/login_email/domain/credencial_params.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/login_with_email.dart';

class LoginStore {
  final IAuthentication _iAuthentication;
  final IloginWithEmail _iloginWithEmail;
  final SnackBarManager _snackBarManager;

  LoginStore(
      this._iAuthentication, this._iloginWithEmail, this._snackBarManager);

  Future<void> checkLogin({
    required String password,
    required String email,
  }) async {
    var result = await _iloginWithEmail.call(
      CredentialsParams(
        password: password,
        email: email,
      ),
    );

    result.fold(
        (failure) => {
              _snackBarManager.showError(message: failure.message),
            }, (loggedUser) {
      AppRouter.navigatorKey.currentState?.pushNamed(AppRouter.HOME);

      AppRouter.navigatorKey.currentState?.pushNamed(AppRouter.HOME);
      _iAuthentication.setUser(loggedUser);
    });
  }
}
