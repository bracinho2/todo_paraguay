import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logget_user_info.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';

abstract class ILoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, LoggedUserInfo>> loggedUser();
}
