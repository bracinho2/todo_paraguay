import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_paraguay/core/authentication_store.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/get_logged_user.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/logout.dart';
import 'package:todo_paraguay/src/login_email/login_injection.dart';

import 'package:todo_paraguay/src/search_page/product_injection.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<FirebaseAuth>(
            create: (_) => FirebaseAuth.instance, lazy: true),
        Provider<IAuthentication>(
            create: (context) => AuthenticationImpl(
                context.read<IGetLoggedUser>(), context.read<ILogout>())),
        ...authInjection,
        ...productModule,
      ],
      child: const AppWidget(),
    ),
  );
}
