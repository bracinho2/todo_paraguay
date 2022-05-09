import 'package:flutter/material.dart';
import 'package:todo_paraguay/src/auth/presenter/store/auth_store_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late final _authStore;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _authStore = Provider.of<AuthStore>(context, listen: false);
    });
  }

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
            key: _authStore.formKey,
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
