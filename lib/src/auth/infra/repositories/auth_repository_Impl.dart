import 'package:dartz/dartz.dart';
import 'package:smart_builder/src/auth/domain/credencial_params.dart';
import 'package:smart_builder/src/auth/domain/errors/errors.dart';
import 'package:smart_builder/src/auth/domain/repositories/auth_repository.dart';
import 'package:smart_builder/src/auth/external/admin/admin_auth_impl.dart';
import 'package:smart_builder/src/auth/infra/datasources/auth_datasource.dart';
import 'package:smart_builder/src/usuarios/model/usuario_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepositoryImpl(
    this.datasource,
  );

  final adminDataSource = AdminAuth();

  @override
  Future<Either<AuthException, UsuarioModel?>> login(
      CredentialsParams params) async {
    if (params.userName == 'sudo') {
      print('chegou no repositorio');
      try {
        print('chaveou para o admin');
        final user = await adminDataSource.login(params);

        print(user);
        return Right(user);
      } on AuthException catch (e) {
        return Left(e);
      } on Exception {
        return Left(AuthException(message: 'Exception Error'));
      }
    } else {
      try {
        print('chaveou para o usuario normal');
        final user = await datasource.login(params);
        return Right(user);
      } on AuthException catch (e) {
        return Left(e);
      } on Exception {
        return Left(AuthException(message: 'Exception Error'));
      }
    }
  }
}
