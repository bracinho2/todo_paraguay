import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/shared/auth_service/auth_service.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';

abstract class IConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
