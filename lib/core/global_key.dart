import 'package:flutter/material.dart';

class AppGlobalKey {
  static final materialKey = GlobalKey();
  static final snackKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
}
