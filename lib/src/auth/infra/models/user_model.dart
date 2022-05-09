import 'package:todo_paraguay/src/auth/domain/entities/logged_user.dart';
import 'package:todo_paraguay/src/auth/domain/entities/logget_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel(
      {required String userName,
      required String password,
      required String email})
      : super(userName: userName, password: password, email: email);

  @override
  String get name => name;

  @override
  String get phoneNumber => phoneNumber;
}
