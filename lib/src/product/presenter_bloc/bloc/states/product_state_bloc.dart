import 'package:todo_paraguay/src/product/domain/entities/product_entity.dart';

abstract class ProductStateBloc {
  const ProductStateBloc();
}

class EmptyProductState extends ProductStateBloc {}

class LoadingProductState extends ProductStateBloc {}

class ErrorProductState extends ProductStateBloc {
  final String message;
  const ErrorProductState(this.message);
}

class SuccessProductState extends ProductStateBloc {
  final List<ProductEntity> products;
  const SuccessProductState(this.products);
}
