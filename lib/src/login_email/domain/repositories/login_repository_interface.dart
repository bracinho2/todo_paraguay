import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/login_email/domain/entities/logged_user_info.dart';
import 'package:todo_paraguay/src/login_email/domain/errors/errors.dart';

abstract class ILoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, LoggedUserInfo>> loggedUser();
}
