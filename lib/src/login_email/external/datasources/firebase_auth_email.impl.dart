import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_paraguay/src/login_email/domain/errors/errors.dart';
import 'package:todo_paraguay/src/login_email/infra/datasources/login_datasource_interface.dart';
import 'package:todo_paraguay/src/login_email/infra/models/user_model.dart';

class FirebaseDataSourceImpl implements ILoginDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
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
