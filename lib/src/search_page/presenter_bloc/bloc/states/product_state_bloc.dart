import '../../../domain/entities/product_entity.dart';

abstract class ProductStateBloc {
  const ProductStateBloc();
}

class EmptyProductState extends ProductStateBloc {}

class LoadingProductState extends ProductStateBloc {}

class ErrorProductState extends ProductStateBloc {
  final String message;
  const ErrorProductState(this.message);
}

//search state
class SearchProductState extends ProductStateBloc {
  final List<ProductEntity> products;
  const SearchProductState(this.products);
}

class SuccessProductState extends ProductStateBloc {
  final List<ProductEntity> products;
  const SuccessProductState(this.products);
}
