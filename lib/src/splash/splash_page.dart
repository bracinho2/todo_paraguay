import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/core/auth_store.dart';
import 'package:todo_paraguay/core/routes.dart';

class SplashPage extends StatefulWidget {
  final IAuthStore authStore;
  const SplashPage({
    Key? key,
    required this.authStore,
  }) : super(key: key);

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

    final isLogged = await widget.authStore.currentUser();

    if (isLogged) {
      Navigator.pushReplacementNamed(context, AppRouter.HOME);
      return;
    }
    Navigator.pushReplacementNamed(context, AppRouter.LOGIN);

    if (isLogged) {
      Navigator.pushReplacementNamed(context, AppRouter.HOME);
      return;
    } else {
      Navigator.pushReplacementNamed(context, AppRouter.LOGIN);
      return;
    }

    // widget.authStore.currentUser().then((value) => value
    //     ? Navigator.pushReplacementNamed(context, AppRouter.HOME)
    //     : Navigator.pushReplacementNamed(context, AppRouter.LOGIN));
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
