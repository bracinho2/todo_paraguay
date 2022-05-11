import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/src/auth/domain/usecases/login_usercase.dart';
import 'package:todo_paraguay/src/auth/external/datasources/firebase_auth_email.impl.dart';
import 'package:todo_paraguay/src/auth/infra/repositories/auth_repository_Impl.dart';
import 'package:todo_paraguay/src/auth/presenter/store/auth_store_controller.dart';

final authInjection = [
  //Dependencias do Modulo de Auth
  Provider<FirebaseDataSourceImpl>(
      create: ((context) =>
          FirebaseDataSourceImpl(context.read<FirebaseAuth>()))),
  Provider<AuthRepositoryImpl>(
      create: ((context) =>
          AuthRepositoryImpl(context.read<FirebaseDataSourceImpl>()))),
  Provider<LoginUserCase>(
      create: ((context) => LoginUserCase(context.read<AuthRepositoryImpl>()))),
  Provider<AuthStore>(
      create: (context) => AuthStore(context.read<LoginUserCase>())),
];
