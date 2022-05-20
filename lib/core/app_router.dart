import 'package:flutter/material.dart';

class AppRouter {
  //Chave para navegar "sem" contexto explícito;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  //rotas nomeadas
  static String SPLASH = '/';
  static String LOGIN = '/login';
  static String HOME = '/home';
  static String CAMERA = '/camera';
}
