import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  });
}