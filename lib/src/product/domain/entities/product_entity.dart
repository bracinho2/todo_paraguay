class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String store;
  final double value;
  final double discount;
  final int priority;
  final bool promo;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.store,
    required this.value,
    required this.discount,
    required this.priority,
    required this.promo,
  });
}
