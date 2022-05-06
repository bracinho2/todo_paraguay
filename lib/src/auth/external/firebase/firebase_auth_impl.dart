import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_builder/src/auth/domain/credencial_params.dart';
import 'package:smart_builder/src/auth/external/firebase/firebase_auth_mapper.dart';
import 'package:smart_builder/src/auth/infra/datasources/auth_datasource.dart';
import 'package:smart_builder/src/usuarios/model/usuario_model.dart';

class FirebaseAuth implements IAuthDatasource {
  final FirebaseFirestore _firestore;

  FirebaseAuth(this._firestore);
  static const String collectionPath = 'users';

  var user;

  @override
  Future<UsuarioModel?> login(CredentialsParams params) async {
    final response = await _firestore
        .collection(collectionPath)
        .where('userName', isEqualTo: params.userName)
        .where('password', isEqualTo: params.password)
        .limit(1)
        .get();

    // final lista = response.docs
    //     .map((doc) => LoggedUserMapper.fromMap(doc.data()))
    //     .toList();

    final lista = response.docs.map((doc) {
      final map = {
        'id': doc.reference.id,
        ...doc.data(),
      };

      return LoggedUserMapper.fromMap(map);
    }).toList();

    for (var element in lista) {
      user = element;
    }

    if (user != null) {
      return user;
    } else {
      return null;
    }
  }
}
