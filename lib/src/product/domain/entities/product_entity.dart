class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String store;
  final double price;
  final double discount;
  final int priority;
  final String image;
  final int votes;
  final bool promo;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.store,
    required this.price,
    required this.discount,
    required this.priority,
    required this.image,
    required this.votes,
    required this.promo,
  });
}
