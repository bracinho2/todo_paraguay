abstract class AppHardDebug {
  printError({required String message});
}

class SplashMessage implements AppHardDebug {
  @override
  printError({required String message}) {
    print(message);
  }
}
