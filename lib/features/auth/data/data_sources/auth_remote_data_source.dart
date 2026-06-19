
import 'package:dio/dio.dart';
import 'package:test1/core/constants/api_constants.dart';
import 'package:test1/features/auth/data/models/user_model.dart';

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

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await dio.post(
      ApiConstants.baseUrl + ApiConstants.register,
      data: {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "agree_terms": 1,
      },
    );

    return UserModel.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}