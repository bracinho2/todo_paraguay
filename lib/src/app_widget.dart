import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service.dart';
import 'package:todo_paraguay/src/login_page/auth_check.dart';
import 'package:todo_paraguay/src/login_page/login_injection.dart';
import 'package:todo_paraguay/src/search_page/product_injection.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
            create: (context) => AuthService(FirebaseAuth.instance)),
        ...productModule,
        ...loginModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: const AuthCheck(),
      ),
    );
  }
}
