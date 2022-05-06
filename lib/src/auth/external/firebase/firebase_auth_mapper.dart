import 'package:smart_builder/src/usuarios/model/usuario_model.dart';

class LoggedUserMapper {
  static UsuarioModel fromJson(Map json) {
    return UsuarioModel(
      id: json['id'],
      nome: json['nome'],
      userName: json['userName'],
      password: json['password'],
      email: json['email'],
      profile: json['profile'],
      empresa: json['empresa'],
      telefone: json['telefone'],
    );
  }

  static UsuarioModel fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      nome: map['nome'],
      userName: map['userName'],
      password: map['password'],
      email: map['email'],
      profile: map['profile'],
      empresa: map['empresa'],
      telefone: map['telefone'],
    );
  }
}
