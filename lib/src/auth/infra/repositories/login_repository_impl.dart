// ignore: file_names

import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logget_user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/auth/domain/repositories/login_repository_interface.dart';
import 'package:todo_paraguay/src/auth/infra/datasources/login_datasource_interface.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDataSource _iLoginDataSource;

  LoginRepositoryImpl(
    this._iLoginDataSource,
  );

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      final user =
          await _iLoginDataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (error) {
      return Left(ErrorLoginEmail(message: 'Error login with Email'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await _iLoginDataSource.currentUser();
      return Right(user);
    } catch (error) {
      return Left(ErrorGetLoggedUser(
          message: "Error ao tentar recuperar usuario atual logado"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _iLoginDataSource.logout();
      return const Right(unit);
    } catch (error) {
      return Left(ErrorLogout(message: 'Erro ao tentar fazer logout'));
    }
  }
}
