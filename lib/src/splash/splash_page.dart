import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/core/auth_store.dart';
import 'package:todo_paraguay/core/routes.dart';
import 'package:todo_paraguay/shared/auth_service/google_auth_service_impl.dart';
import 'package:todo_paraguay/src/auth/presenter/store/auth_store_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controleSplash();
    });
  }

  Future<void> controleSplash() async {
    await Future.delayed(const Duration(seconds: 1));

    context.read<AuthStoreImpl>().currentUser().then((value) => value
        ? Navigator.pushReplacementNamed(context, AppRouter.HOME)
        : Navigator.pushReplacementNamed(context, AppRouter.LOGIN));
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.amber,
    body: Stack(
      children: const [
        Center(
          child: Text(
            'Todo Paraguay',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
