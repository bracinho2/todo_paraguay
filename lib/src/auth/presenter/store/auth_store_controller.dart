import 'package:flutter/material.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/usecases/login_usercase.dart';

class AuthStore {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ILoginUsercase _iLoginUsercase;

  AuthStore(this._iLoginUsercase);

  void validateLoginForm({
    required BuildContext context,
    required String userName,
    required String password,
    required String email,
  }) {
    final form = formKey.currentState;
    if (form!.validate()) {
      checkLogin(
        userName: userName,
        password: password,
        email: email,
        context: context,
      );
    }
  }

  Future<void> checkLogin(
      {required String userName,
      required String password,
      required String email,
      required BuildContext context}) async {
    var usuarioModel = await _iLoginUsercase.call(
      CredentialsParams(
        userName: userName,
        password: password,
        email: 'bracinho2@gmail.com',
      ),
    );

    var snackBar = SnackBar(
      content: const Text('Suas Credencias não foram encontradas!'),
      action: SnackBarAction(
        label: 'Tentar Novamente!',
        onPressed: () {},
      ),
    );

    usuarioModel.fold(
        (l) => {
              ScaffoldMessenger.of(context).showSnackBar(snackBar),
            }, (r) {
      if (r != null) {
        //authenticationController.navigatorForward(context, r);
        return r;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //print(r.toString());
        return r;
      }
    });
  }
}
