import 'package:test1/features/auth/domain/entity/user_entity.dart';

class RegisterResponseEntity {
  final UserEntity user;
  final String token;

  const RegisterResponseEntity({required this.user, required this.token});
}
