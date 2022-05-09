import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';
import 'package:todo_paraguay/src/auth/domain/repositories/auth_repository.dart';

abstract class ILoginUsercase {
  Future<Either<Failure, LoggedUser?>> call(CredentialsParams params);
}

class LoginUserCase implements ILoginUsercase {
  final IAuthRepository repository;
  LoginUserCase(this.repository);

  @override
  Future<Either<Failure, LoggedUser?>> call(CredentialsParams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException(message: 'Erro de Email'));
    }
    if (params.userName.isEmpty) {
      return Left(AuthException(message: 'Erro de userName'));
    }
    if (params.password.isEmpty) {
      return Left(AuthException(message: 'Erro de Senha'));
    }

    return await repository.login(params);
  }
}
