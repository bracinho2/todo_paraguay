import 'package:todo_paraguay/src/category/domain/entities/category_entity.dart';
import 'package:todo_paraguay/src/category/domain/repositores/get_categories_interface.dart';
import 'package:todo_paraguay/src/category/infra/datasource/categories_datasource_interface.dart';
import 'package:todo_paraguay/src/category/infra/mappers/category_mapper.dart';

class CategoryRepositoryImpl implements ICategoriesRepository {
  final ICategoriesDatasource _iCategoriesDatasource;

  CategoryRepositoryImpl(this._iCategoriesDatasource);
  @override
  Future<List<CategoryEntity>> getCategories() async {
    final response = await _iCategoriesDatasource.getCategories();

    final List<CategoryEntity> list = [];

    for (var object in response) {
      final category = CategoryMapper.fromMap(object);
      list.add(category);
    }
    return list;
  }
}
