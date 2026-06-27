import 'package:test1/features/auth/data/model/user_model.dart';

class RegisterResponseModel {
  final bool success;
  final String message;
  final UserModel user;
  final String token;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'],
      message: json['message'],
      user: UserModel.fromJson(json['data']['user']),
      token: json['data']['token'],
    );
  }
}
