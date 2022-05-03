import 'package:todo_paraguay/src/store/domain/entities/store_entity.dart';

class StoreMapper extends StoreEntity {
  StoreMapper({
    required String id,
    required String name,
    required String address,
    required String email,
    required String phone,
    required String instagram,
    required String facebook,
  }) : super(
          id: id,
          name: name,
          address: address,
          email: email,
          phone: phone,
          instagram: instagram,
          facebook: facebook,
        );

  static Map<String, dynamic> toMap(StoreEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'address': entity.address,
      'email': entity.email,
      'phone': entity.phone,
      'instagram': entity.instagram,
      'faceboo': entity.facebook,
    };
  }

  factory StoreMapper.fromMap(Map<String, dynamic> map) {
    return StoreMapper(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      instagram: map['instagram'] ?? '',
      facebook: map['facebook'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoreEntity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
