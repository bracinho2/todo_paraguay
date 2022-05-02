import '../entities/product_entity.dart';
import '../repositories/get_categories_interface.dart';

abstract class IGetProductUsecase {
  Future<List<ProductEntity>> call();
}

class GetProductsUsecase implements IGetProductUsecase {
  final IProductRepository _iProductRepository;

  GetProductsUsecase(this._iProductRepository);
  @override
  Future<List<ProductEntity>> call() {
    return _iProductRepository.getProducts();
  }
}
