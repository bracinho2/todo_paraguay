import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/shared/auth_service/google_auth_service_impl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GoogleAuth _auth;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _auth = Provider.of<GoogleAuth>(context, listen: false);
    });
  }

  void setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
        titulo = 'Bem-Vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  login(BuildContext context) async {
    try {
      _auth.login(context: context, email: email.text, password: senha.text);
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  registrar(BuildContext context) async {
    try {
      _auth.register(email: email.text, password: senha.text);
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isLogin) {
                        login(context);
                      } else {
                        registrar(context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            actionButton,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
