import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/domain/credencial_params.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';
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
    return UserModel(
      name: user?.displayName,
      email: user?.email,
    );
  }

  @override
  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel> currentUser() async {
    var user = _firebaseAuth.currentUser;

    if (user == null) {
      throw ErrorGetLoggedUser(message: 'Não pegou o usuário logado');
    }

    return UserModel(
      name: user.displayName,
      email: user.email,
    );
  }
}
