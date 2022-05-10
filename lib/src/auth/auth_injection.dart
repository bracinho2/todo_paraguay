import 'package:provider/provider.dart';
import 'package:todo_paraguay/src/auth/domain/usecases/login_usercase.dart';
import 'package:todo_paraguay/src/auth/infra/repositories/auth_repository_Impl.dart';
import 'package:todo_paraguay/src/auth/presenter/store/auth_store_controller.dart';

final authInjection = [
  Provider<AuthStore>(create: (context) => AuthStore(context.read())),
  Provider<LoginUserCase>(create: (context) => LoginUserCase(context.read())),
  Provider<AuthRepositoryImpl>(
      create: (context) => AuthRepositoryImpl(context.read())),
];
