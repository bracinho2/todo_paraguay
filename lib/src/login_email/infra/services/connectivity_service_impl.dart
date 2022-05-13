import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/login_email/domain/errors/errors.dart';
import 'package:todo_paraguay/src/login_email/domain/services/connectivity_service_interface.dart';
import 'package:todo_paraguay/src/login_email/external/drivers/flutter_connectivity_driver_impl.dart';

class ConnectivityServiceImpl implements IConnectivityService {
  final FlutterConnectivyDriver _conenectivityDriver;

  ConnectivityServiceImpl(this._conenectivityDriver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await _conenectivityDriver.isOnline;
      if (check) {
        return const Right(unit);
      }
      throw ConnectionError(message: 'Você está offline');
    } on Failure catch (error) {
      return left(ConnectionError(message: error.toString()));
    }
  }
}
