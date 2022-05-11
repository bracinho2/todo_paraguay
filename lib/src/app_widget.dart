import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/core/auth_store.dart';
import 'package:todo_paraguay/core/routes.dart';
import 'package:todo_paraguay/shared/auth_service/google_auth_service_impl.dart';
import 'package:todo_paraguay/src/auth/auth_injection.dart';
import 'package:todo_paraguay/src/auth/presenter/page/login_page.dart';
import 'package:todo_paraguay/src/login_page/login_injection.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/product_home_page_bloc.dart';
import 'package:todo_paraguay/src/search_page/product_injection.dart';
import 'package:todo_paraguay/src/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuth>(create: ((context) => FirebaseAuth.instance)),
        Provider<AuthStoreImpl>(
            create: (context) => AuthStoreImpl(context.read())),
        Provider<GoogleAuth>(create: (context) => GoogleAuth(context.read())),
        Provider<SplashPage>(
            create: (context) => SplashPage(
                  authStore: context.read(),
                )),
        ...authInjection,
        ...productModule,
        ...loginModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        initialRoute: '/',
        routes: {
          AppRouter.SPLASH: (_) => context.read<SplashPage>(),
          AppRouter.LOGIN: (context) => const LoginPageAuth(),
          AppRouter.HOME: (context) => const ProductHomePageBloc(),
        },
      ),
    );
  }
}
