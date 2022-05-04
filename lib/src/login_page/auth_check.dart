import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/product_home_page_bloc.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  AuthService _auth = AuthService(FirebaseAuth.instance);

  @override
  void initState() {
    super.initState();
    _auth.addListener(listener);
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   _auth = Provider.of<AuthService>(context, listen: false);
    // });
  }

  void listener() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _auth.removeListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    if (_auth.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (_auth.user == null) {
      return const LoginPage();
    }

    return const ProductHomePageBloc();
  }
}
