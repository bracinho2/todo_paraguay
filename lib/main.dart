import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_paraguay/shared/snackbar_manager/snackbar_manager.dart';
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
        Provider<SnackBarManager>(create: (context) => SnackBarManager()),
        Provider<FirebaseAuth>(create: (_) => FirebaseAuth.instance),
        ...authInjection,
        ...productModule,
      ],
      child: const AppWidget(),
    ),
  );
}
