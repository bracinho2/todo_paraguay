import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/login_email/domain/errors/errors.dart';

abstract class IConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
