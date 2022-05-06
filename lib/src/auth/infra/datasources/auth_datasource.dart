import 'package:smart_builder/src/auth/domain/credencial_params.dart';
import 'package:smart_builder/src/usuarios/model/usuario_model.dart';

abstract class IAuthDatasource {
  Future<UsuarioModel?> login(CredentialsParams params);
}
