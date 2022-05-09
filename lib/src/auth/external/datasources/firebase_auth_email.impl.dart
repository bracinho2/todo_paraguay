import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/infra/datasources/auth_datasource_interface.dart';
import 'package:todo_paraguay/src/auth/infra/models/user_model.dart';

class FirebaseDataSourceImpl implements IAuthDatasource {
  final FirebaseAuth _firebaseAuth;

  FirebaseDataSourceImpl(this._firebaseAuth);

  @override
  Future<LoggedUser?> login(CredentialsParams params) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email, password: params.password);
    final user = result.user;
    return UserModel(userName: user.displayName, password: password, email: email)
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
