import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_builder/shared/services/encrypt_tool/encrypt_tool_interface.dart';
import 'package:smart_builder/src/local_preferences/auth_controller_save_local_user.dart';
import 'package:smart_builder/src/auth/domain/usecases/login_usercase.dart';

import 'package:smart_builder/src/auth/domain/credencial_params.dart';

class AuthController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginUserCase = GetIt.instance.get<LoginUserCase>();
  final authenticationController =
      GetIt.instance.get<AuthenticationController>();
  final encryptor = GetIt.instance.get<IEncryptTool>();

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
    var usuarioModel = await loginUserCase.call(
      CredentialsParams(
        userName: userName,
        password: userName == 'sudo'
            ? password
            : encryptor.encryptor(string: password),
        //email: 'bracinho2@gmail.com',
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
        authenticationController.navigatorForward(context, r);
        return r;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //print(r.toString());
        return r;
      }
    });
  }
}
