import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/infra/models/user_model.dart';

abstract class IAuthDatasource {
  Future<LoggedUser?> login(CredentialsParams params);
  Future<void> logout();
  Future<UserModel> currentUser();
}
