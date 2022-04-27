import 'package:todo_paraguay/src/category/infra/datasource/categories_datasource_interface.dart';

class CategoryDatasourceImpl implements ICategoriesDatasource {
  @override
  Future<List<Map<String, dynamic>>> getCategories() async {
    //dados para teste;
    final mockvalues = [
      {"id": "1", "name": "Radio", "priority": "1"},
      {"id": "1", "name": "Comida", "priority": "2"},
      {"id": "1", "name": "Bebida", "priority": "3"},
    ];
    return mockvalues;
  }
}
