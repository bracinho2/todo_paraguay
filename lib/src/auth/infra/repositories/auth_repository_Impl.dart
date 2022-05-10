import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';
import 'package:todo_paraguay/src/auth/domain/repositories/auth_repository.dart';
import 'package:todo_paraguay/src/auth/infra/datasources/auth_datasource_interface.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource _authDatasource;

  AuthRepositoryImpl(
    this._authDatasource,
  );

  @override
  Future<Either<Failure, LoggedUser?>> login(CredentialsParams params) async {
    try {
      final user = await _authDatasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthException(message: 'Senha errada'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _authDatasource.logout();
      return const Right(unit);
    } catch (error) {
      return Left(ErrorLogout(message: 'Erro ao tentar fazer logout'));
    }
  }

  @override
  Future<Either<Failure, Unit>> register(CredentialsParams params) {
    throw UnimplementedError();
  }
}
