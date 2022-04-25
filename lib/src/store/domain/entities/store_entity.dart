class StoreEntity {
  final String id;
  final String name;
  final String address;
  final String email;
  final String phone;
  final String? instagram;
  final String? facebook;

  const StoreEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    this.instagram,
    this.facebook,
  });
}
