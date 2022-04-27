import 'package:todo_paraguay/src/category/domain/entities/category_entity.dart';

abstract class ICategoriesRepository {
  Future<List<CategoryEntity>> getCategories();
}
