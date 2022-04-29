import 'package:todo_paraguay/src/product/domain/usecases/get_product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/bloc/events/product_events.dart';
import 'package:todo_paraguay/src/product/presenter_bloc/bloc/states/product_state_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStateBloc> {
  final IGetProductUsecase _iGetProductUsecase;

  ProductBloc(this._iGetProductUsecase) : super(EmptyProductState()) {
    on<FetchProductEvent>(_fetchProducts);
    on<ClearProductEvent>((event, emit) {
      emit(const SuccessProductState([]));
    });
    on<SearchProductEvent>(_fetchFilteredProducts);
  }

  Future<void> _fetchProducts(
      FetchProductEvent event, Emitter<ProductStateBloc> emit) async {
    emit(LoadingProductState());
    try {
      final products = await _iGetProductUsecase.call();
      emit(SuccessProductState(products));
    } catch (e) {
      emit(ErrorProductState(e.toString()));
    }
  }

  Future<void> _fetchFilteredProducts(
      SearchProductEvent event, Emitter<ProductStateBloc> emit) async {
    emit(LoadingProductState());
    try {
      final products = await _iGetProductUsecase.call();
      final filteredList = products
          .where((element) =>
              element.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(SearchProductState(filteredList));
    } catch (e) {
      emit(ErrorProductState(e.toString()));
    }
  }
}
