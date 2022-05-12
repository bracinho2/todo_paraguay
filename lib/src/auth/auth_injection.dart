import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/src/auth/domain/repositories/login_repository_interface.dart';
import 'package:todo_paraguay/src/auth/domain/services/connectivity_service_interface.dart';
import 'package:todo_paraguay/src/auth/domain/usecases/login_with_email.dart';
import 'package:todo_paraguay/src/auth/external/datasources/firebase_auth_email.impl.dart';
import 'package:todo_paraguay/src/auth/infra/repositories/login_repository_impl.dart';
import 'package:todo_paraguay/src/auth/presenter/store/auth_store_controller.dart';

final authInjection = [
  //Dependencias do Modulo de Auth
  Provider<FirebaseDataSourceImpl>(
      create: ((context) =>
          FirebaseDataSourceImpl(context.read<FirebaseAuth>()))),
  Provider<LoginRepositoryImpl>(
      create: ((context) =>
          LoginRepositoryImpl(context.read<FirebaseDataSourceImpl>()))),
  Provider<LoginWithEmailImpl>(
      create: ((context) => LoginWithEmailImpl(context.read<ILoginRepository>(),
          context.read<IConnectivityService>()))),
  Provider<AuthStore>(
      create: (context) => AuthStore(context.read<LoginWithEmailImpl>())),
];
