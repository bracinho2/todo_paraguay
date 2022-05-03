import 'package:todo_paraguay/src/store/domain/entities/store_entity.dart';

abstract class IStoreRepository {
  Future<List<StoreEntity>> getStores();
}
