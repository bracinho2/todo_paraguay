import 'package:smart_builder/shared/admin_password/admin_password.dart';
import 'package:smart_builder/src/auth/domain/credencial_params.dart';
import 'package:smart_builder/src/auth/infra/datasources/auth_datasource.dart';
import 'package:smart_builder/src/usuarios/model/usuario_model.dart';

class AdminAuth implements IAuthDatasource {
  @override
  Future<UsuarioModel?> login(CredentialsParams params) async {
    final _sudoPassword = SudoPassword();
    print('AdminAuth');
    final validaSenha =
        await _sudoPassword.verificaSenha(senhaEnviada: params.password);

    if (params.userName == 'sudo' && validaSenha) {
      print('Validou');
      final user = UsuarioModel(
        id: '00',
        nome: 'Sudo',
        userName: 'sudo',
        password: 'password',
        email: 'email',
        empresa: 'empresa',
        profile: 'Sudo',
        telefone: '',
      );
      return user;
    } else {
      print('nao validou');
      return null;
    }
  }
}
