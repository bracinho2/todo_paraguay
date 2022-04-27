import 'package:todo_paraguay/src/product/domain/entities/product_entity.dart';

class ProductMapper extends ProductEntity {
  ProductMapper({
    required String id,
    required String name,
    required String description,
    required String store,
    required double value,
    required double discount,
    required int priority,
    required int votes,
    required bool promo,
  }) : super(
            id: id,
            name: name,
            description: description,
            store: store,
            value: value,
            discount: discount,
            priority: priority,
            votes: votes,
            promo: promo);

  static Map<String, dynamic> toMap(ProductEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'description': entity.description,
      'store': entity.store,
      'value': entity.value,
      'votes': entity.votes,
      'promo': entity.promo,
    };
  }

  factory ProductMapper.fromMap(Map<String, dynamic> map) {
    return ProductMapper(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      store: map['store'] ?? '',
      value: map['value'] ?? '',
      discount: map['discount'] ?? '',
      priority: map['priority'] ?? '',
      votes: map['votes'] ?? '',
      promo: map['promo'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
