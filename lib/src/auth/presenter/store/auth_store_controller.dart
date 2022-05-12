import 'package:flutter/material.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/usecases/login_with_email.dart';

class AuthStore {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final IloginWithEmail _iloginWithEmail;

  AuthStore(this._iloginWithEmail);

  void validateLoginForm({
    required BuildContext context,
    required String password,
    required String email,
  }) {
    final form = formKey.currentState;
    if (form!.validate()) {
      checkLogin(
        password: password,
        email: email,
        context: context,
      );
    }
  }

  Future<void> checkLogin(
      {required String password,
      required String email,
      required BuildContext context}) async {
    var result = await _iloginWithEmail.call(
      CredentialsParams(
        password: password,
        email: email,
      ),
    );

    var snackBar = SnackBar(
      content: const Text('Suas Credencias não foram encontradas!'),
      action: SnackBarAction(
        label: 'Tentar Novamente!',
        onPressed: () {},
      ),
    );

    result.fold(
        (l) => {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(l.message))),
            }, (r) {
      if (r != null) {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const ProductHomePageBloc()));
        //return r;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //print(r.toString());
        return r;
      }
    });
  }
}
