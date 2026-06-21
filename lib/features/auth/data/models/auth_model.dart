import 'package:test1/features/auth/data/models/user_model.dart';

class AuthModel {
  final bool success;
  final String message;
  final UserModel? userModel;

  AuthModel({
    required this.success,
    required this.message,
    required this.userModel,
  });
  factory AuthModel.fromJson(Map<String, dynamic> jsonData) {
    return AuthModel(
      success: jsonData['success'],
      message: jsonData['message'],
      userModel: jsonData['success']==true ? UserModel.fromJson(jsonData['data']) : null,
    );
  }
}
