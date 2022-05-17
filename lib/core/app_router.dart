import 'package:flutter/material.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static String SPLASH = '/';
  static String LOGIN = '/login';
  static String HOME = '/home';
}
