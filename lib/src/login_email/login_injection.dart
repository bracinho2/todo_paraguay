import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:todo_paraguay/core/authentication_store.dart';
import 'package:todo_paraguay/src/login_email/domain/repositories/login_repository_interface.dart';
import 'package:todo_paraguay/src/login_email/domain/services/connectivity_service_interface.dart';
import 'package:todo_paraguay/src/login_email/domain/usecases/login_with_email.dart';
import 'package:todo_paraguay/src/login_email/external/datasources/firebase_auth_email.impl.dart';
import 'package:todo_paraguay/src/login_email/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:todo_paraguay/src/login_email/infra/drivers/connectivity_driver_interface.dart';
import 'package:todo_paraguay/src/login_email/infra/repositories/login_repository_impl.dart';
import 'package:todo_paraguay/src/login_email/infra/services/connectivity_service_impl.dart';
import 'package:todo_paraguay/src/login_email/presenter/store/auth_store_controller.dart';

final authInjection = [
  //DATASOURCE
  Provider<FirebaseDataSourceImpl>(
      create: ((context) =>
          FirebaseDataSourceImpl(context.read<FirebaseAuth>()))),

  //REPOSITORY
  Provider<ILoginRepository>(
      create: ((context) =>
          LoginRepositoryImpl(context.read<FirebaseDataSourceImpl>()))),

  //CONNECTIVITY
  Provider<Connectivity>(
    create: (context) => Connectivity(),
    lazy: true,
  ),

  Provider<IConnectivityDriver>(
    create: (context) => FlutterConnectivyDriver(context.read<Connectivity>()),
  ),

  Provider<IConnectivityService>(
      create: (context) =>
          ConnectivityServiceImpl(context.read<IConnectivityDriver>())),

  //USERCASE
  Provider<IloginWithEmail>(
      create: ((context) => LoginWithEmailImpl(context.read<ILoginRepository>(),
          context.read<IConnectivityService>()))),

  //STORE
  Provider<LoginStore>(
      create: (context) => LoginStore(
          context.read<IAuthentication>(), context.read<IloginWithEmail>())),
];
