import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';

abstract class IAuthDatasource {
  Future<LoggedUser?> login(CredentialsParams params);
  Future<void> logout();
}
