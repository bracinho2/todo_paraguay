import 'package:provider/provider.dart';
import 'package:todo_paraguay/src/search_page/domain/repositories/get_categories_interface.dart';
import 'package:todo_paraguay/src/search_page/domain/usecases/get_product_usecase.dart';
import 'package:todo_paraguay/src/search_page/external/remote/remote_datasource_impl.dart';
import 'package:todo_paraguay/src/search_page/infra/datasource/product_datasource_interface.dart';
import 'package:todo_paraguay/src/search_page/infra/repositories/get_product_impl.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/bloc/product_bloc.dart';

final productModule = [
  Provider<IProductDatasource>(create: (context) => ProductDatasourceImpl()),

  Provider<IProductRepository>(
      create: (context) => ProductRepositoryImpl(context.read())),

  Provider<IGetProductUsecase>(
      create: (context) => GetProductsUsecase(context.read())),

  //bloc provider; //nao esquecer de tipificar no generics;
  Provider<ProductBloc>(create: (context) => ProductBloc(context.read())),
];
