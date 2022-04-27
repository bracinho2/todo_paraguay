import 'package:todo_paraguay/src/product/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getProducts();
}
