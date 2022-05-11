import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_paraguay/core/authentication_store.dart';
import 'package:todo_paraguay/src/auth/auth_injection.dart';
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
        Provider<AuthenticationImpl>(
            create: (context) =>
                AuthenticationImpl(context.read<FirebaseAuth>())),
        ...authInjection,
        ...productModule,
      ],
      child: const AppWidget(),
    ),
  );
}
