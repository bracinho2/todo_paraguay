import 'package:firebase_auth/firebase_auth.dart';

class HardDebug {
  void loggedUserInfo(User? user) {
    print(
        '<--Logged User:--->\n\n${user?.email}\n${user?.displayName}\n\n<---End--->');
  }
}
