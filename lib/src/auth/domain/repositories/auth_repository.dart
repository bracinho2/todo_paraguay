import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';

abstract class IAuthRepository {
  Future<Either<Failure, LoggedUser?>> login(CredentialsParams params);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> register(CredentialsParams params);
}
