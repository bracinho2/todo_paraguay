import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/core/authentication_store.dart';
import 'package:todo_paraguay/core/app_router.dart';
import 'package:todo_paraguay/src/login_email/presenter/page/login_page.dart';
import 'package:todo_paraguay/src/login_email/presenter/store/auth_store_controller.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/bloc/product_bloc.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/product_home_page_bloc.dart';
import 'package:todo_paraguay/src/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      initialRoute: '/',
      routes: {
        AppRouter.SPLASH: (_) =>
            SplashPage(authStore: context.read<AuthenticationImpl>()),
        AppRouter.LOGIN: (context) => LoginPageAuth(
              authStore: context.read<AuthStore>(),
            ),
        AppRouter.HOME: (context) => ProductHomePageBloc(
            bloc: context.read<ProductBloc>(),
            auth: context.read<AuthenticationImpl>()),
      },
    );
  }
}
