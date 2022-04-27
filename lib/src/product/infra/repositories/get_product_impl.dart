import 'package:todo_paraguay/src/product/domain/entities/product_entity.dart';
import 'package:todo_paraguay/src/product/domain/repositories/get_categories_interface.dart';
import 'package:todo_paraguay/src/product/infra/datasource/product_datasource_interface.dart';
import 'package:todo_paraguay/src/product/infra/mappers/product_mapper.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductDatasource _iProductDatasource;

  ProductRepositoryImpl(this._iProductDatasource);
  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await _iProductDatasource.getProducts();

    final List<ProductEntity> list = [];

    for (var object in response) {
      final category = ProductMapper.fromMap(object);
      list.add(category);
    }
    return list;
  }
}
