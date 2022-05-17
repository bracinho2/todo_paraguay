import 'package:flutter/material.dart';
import 'package:todo_paraguay/core/app_router.dart';
import 'package:todo_paraguay/shared/snackbar_manager/snackbar_manager.dart';
import 'package:todo_paraguay/src/login_email/domain/credencial_params.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/login_with_email.dart';

class LoginStore {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final IloginWithEmail _iloginWithEmail;

  LoginStore(this._iloginWithEmail);

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
              SnackBarManager().showError(message: failure.message),
            }, (loggedUser) {
      AppRouter.navigatorKey.currentState?.pushNamed(AppRouter.HOME);

      print('AUTH-STORE -> ENCONTROU O USUARIO: ENVIAR PARA HOME');
      AppRouter.navigatorKey.currentState?.pushNamed(AppRouter.HOME);
      //return loggedUser;
    });
  }
}
