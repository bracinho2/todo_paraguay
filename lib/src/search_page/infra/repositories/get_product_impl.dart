import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/get_categories_interface.dart';
import '../datasource/product_datasource_interface.dart';
import '../mappers/product_mapper.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductDatasource _iProductDatasource;

  ProductRepositoryImpl(this._iProductDatasource);
  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await _iProductDatasource.getProducts();

    //response.map(ProductMapper.fromMap);

    // final List<ProductEntity> list = [];

    // for (var object in response) {
    //   final product = ProductMapper.fromMap(object);
    //   list.add(product);
    // }

    return response.map(ProductMapper.fromMap).toList();
  }
}
