import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/auth/domain/errors/errors.dart';
import 'package:todo_paraguay/src/auth/domain/services/connectivity_service_interface.dart';
import 'package:todo_paraguay/src/auth/infra/drivers/connectivity_driver_interface.dart';

class ConnectivityServiceImpl implements IConnectivityService {
  final ConenectivityDriver _conenectivityDriver;

  ConnectivityServiceImpl(this._conenectivityDriver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await _conenectivityDriver.isOnline;
      if (check) {
        return const Right(unit);
      }
      throw ConnectionError(message: 'Você está offline');
    } on Failure catch (e) {
      return left(ConnectionError(message: e.toString()));
    }
  }
}
