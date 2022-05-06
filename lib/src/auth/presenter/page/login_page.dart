import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_builder/shared/helpers/validator_helpers.dart';
import 'package:smart_builder/shared/widget/button_widget.dart';
import 'package:smart_builder/shared/widget/input_text_widget.dart';
import 'package:smart_builder/src/auth/presenter/store/auth_store_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final authController = GetIt.instance.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: authController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                  child: Image.asset('assets/images/sb_logo.png'),
                ),
                const SizedBox(
                  height: 50,
                ),
                InputTextWidget(
                  label: 'usuário',
                  controller: _usernameController,
                  validator: ValidatorHelper.validaString,
                  obscureText: false,
                  enabled: true,
                  minLines: 1,
                  maxLines: 1,
                ),
                InputTextWidget(
                  label: 'senha',
                  controller: _passwordController,
                  validator: ValidatorHelper.validaString,
                  obscureText: true,
                  enabled: true,
                  minLines: 1,
                  maxLines: 1,
                ),
                ButtonWidget(
                  label: 'Entrar',
                  onPressed: () {
                    authController.validateLoginForm(
                      userName: _usernameController.text,
                      password: _passwordController.text,
                      email: 'bracinho2@hotmail.com',
                      context: context,
                    );

                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
