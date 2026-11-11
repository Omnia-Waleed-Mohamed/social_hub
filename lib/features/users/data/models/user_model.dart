import 'package:social_hub/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.city,
    required super.companyName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final address = json['address'] as Map<String, dynamic>? ?? {};
    final company = json['company'] as Map<String, dynamic>? ?? {};

    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      city: address['city'] as String? ?? '',
      companyName: company['name'] as String? ?? '',
    );
  }

  factory UserModel.fromCache(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': {
        'city': city,
      },
      'company': {
        'name': companyName,
      },
    };
  }
}
