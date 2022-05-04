import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/product_home_page_bloc.dart';

import 'login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  AuthService auth = AuthService();

  @override
  void initState() {
    auth.addListener(listener);
    super.initState();
  }

  void listener() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    auth.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    if (auth.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (auth.user == null) {
      return const LoginPage();
    }

    return const ProductHomePageBloc();
  }
}
