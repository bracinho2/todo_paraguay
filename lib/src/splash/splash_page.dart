import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/shared/auth_service/google_auth_service_impl.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    print('Splash Page Carregada');
    context.read<GoogleAuth>().authCheck(context);
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Todo Paraguay',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
