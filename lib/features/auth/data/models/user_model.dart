import 'package:test1/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.phone,
    required super.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    final user = jsonData['user'];
    return UserModel(
      id: user['id'],
      username: user['username'],
      email: user['email'],
      phone: user['phone'],
      token: jsonData['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user': {'id': id, 'username': username, 'email': email, 'phone': phone},
      'token': token,
    };
  }
}
