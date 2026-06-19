import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await dio.post(
      'https://your-api-link.com/api/register',
      data: {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "agree_terms": true,
      },
    );

    return UserModel.fromJson(response.data);
  }
}