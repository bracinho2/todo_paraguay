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
    on<SearchProductEvent>((event, emit) {
      emit(SearchProductState());
    });
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
}
