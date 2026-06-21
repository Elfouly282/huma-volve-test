
import 'package:test1/features/auth/domain/entities/user_entity.dart';

 class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.phone,
    required super.createdAt,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>;
    return UserModel(
      id: user['id'] as int,
      username: user['username'] as String,
      email: user['email'] as String,
      phone: user['phone'] as String,
      createdAt: user['created_at'] as String,
      token: json['token'] as String,
    );
  }
}