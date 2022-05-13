import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/src/login_email/domain/repositories/login_repository_interface.dart';
import 'package:todo_paraguay/src/login_email/domain/services/connectivity_service_interface.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/login_with_email.dart';
import 'package:todo_paraguay/src/login_email/external/datasources/firebase_auth_email.impl.dart';
import 'package:todo_paraguay/src/login_email/infra/repositories/login_repository_impl.dart';
import 'package:todo_paraguay/src/login_email/presenter/store/auth_store_controller.dart';

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
