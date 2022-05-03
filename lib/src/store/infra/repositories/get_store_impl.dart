import 'package:todo_paraguay/src/store/domain/entities/store_entity.dart';
import 'package:todo_paraguay/src/store/infra/datasource/store_datasource_interface.dart';

import '../../domain/repositories/get_store_interface.dart';
import '../mappers/store_mapper.dart';

class StoreRepositoryImpl implements IStoreRepository {
  final IStoreDatasource _iStoreDatasource;

  StoreRepositoryImpl(this._iStoreDatasource);
  @override
  Future<List<StoreEntity>> getStores() async {
    final response = await _iStoreDatasource.getStores();

    //response.map(ProductMapper.fromMap);

    // final List<ProductEntity> list = [];

    // for (var object in response) {
    //   final product = ProductMapper.fromMap(object);
    //   list.add(product);
    // }

    return response.map(StoreMapper.fromMap).toList();
  }
}
