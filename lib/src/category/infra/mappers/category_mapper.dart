import 'package:todo_paraguay/src/category/domain/entities/category_entity.dart';

class CategoryMapper extends CategoryEntity {
  CategoryMapper(
      {required String id, required String name, required int priority})
      : super(
          id: id,
          name: name,
          priority: priority,
        );

  static Map<String, dynamic> toMap(CategoryEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'priority': entity.priority,
    };
  }

  factory CategoryMapper.fromMap(Map<String, dynamic> map) {
    return CategoryMapper(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      priority: map['priority'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
