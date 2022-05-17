import 'package:flutter/material.dart';

import 'package:todo_paraguay/shared/widgets/button_widget.dart';
import 'package:todo_paraguay/shared/widgets/input_text_widget.dart';
import 'package:todo_paraguay/src/login_email/presenter/store/auth_store_controller.dart';

class LoginPageAuth extends StatefulWidget {
  final LoginStore authStore;
  const LoginPageAuth({
    Key? key,
    required this.authStore,
  }) : super(key: key);

  @override
  State<LoginPageAuth> createState() => _LoginPageAuthState();
}

class _LoginPageAuthState extends State<LoginPageAuth> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   _authStore = Provider.of<AuthStore>(context, listen: false);
    // });
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 110,
              //   child: Image.asset('assets/images/sb_logo.png'),
              // ),
              const SizedBox(
                height: 50,
              ),
              InputTextWidget(
                label: 'email',
                controller: _emailController,
                //validator: ValidatorHelper.validaString,
                obscureText: false,
                enabled: true,
                minLines: 1,
                maxLines: 1,
              ),
              InputTextWidget(
                label: 'senha',
                controller: _passwordController,
                //validator: ValidatorHelper.validaString,
                obscureText: true,
                enabled: true,
                minLines: 1,
                maxLines: 1,
              ),
              ButtonWidget(
                label: 'Entrar',
                onPressed: () {
                  widget.authStore.checkLogin(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  //_emailController.clear();
                  //_passwordController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
