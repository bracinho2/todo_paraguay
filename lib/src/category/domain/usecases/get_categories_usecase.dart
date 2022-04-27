import 'package:todo_paraguay/src/category/domain/entities/category_entity.dart';

import '../repositores/get_categories_interface.dart';

abstract class IGetCategoriesUsecase {
  Future<List<CategoryEntity>> call();
}

class GetCategories implements IGetCategoriesUsecase {
  final ICategoriesRepository _iCategoriesRepository;

  GetCategories(this._iCategoriesRepository);
  @override
  Future<List<CategoryEntity>> call() {
    return _iCategoriesRepository.getCategories();
  }
}
