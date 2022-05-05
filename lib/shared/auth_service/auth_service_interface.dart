import 'package:flutter/material.dart';

abstract class IAuthService {
  void register({required String email, required String password});
  void login(
      {required BuildContext context,
      required String email,
      required String password});
  void logout({required BuildContext context});
}
