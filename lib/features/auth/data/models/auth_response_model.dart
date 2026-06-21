import 'package:test1/features/auth/data/models/user_model.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';

class AuthResponseModel {
  final bool success;
  final String message;
  final UserModel user;

  const AuthResponseModel({
    required this.success,
    required this.message,
    required this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        success: json['success'] as bool,
        message: json['message'] as String,
        user: UserModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  UserEntity toEntity() => user;
}
