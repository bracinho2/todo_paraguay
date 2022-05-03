import 'package:todo_paraguay/src/store/domain/entities/store_entity.dart';

import '../repositories/get_store_interface.dart';

abstract class IGetStoreUsecase {
  Future<List<StoreEntity>> call();
}

class GetStoresUsecase implements IGetStoreUsecase {
  final IStoreRepository _iStoreRepository;

  GetStoresUsecase(this._iStoreRepository);
  @override
  Future<List<StoreEntity>> call() {
    return _iStoreRepository.getStores();
  }
}
