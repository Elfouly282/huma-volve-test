import 'package:dartz/dartz.dart';
import 'package:test1/core/errors/failure.dart';
import 'package:test1/features/auth/data/repositories/auth_repos.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';

class RegisterUseCase {
  final AuthRepos repos;

  RegisterUseCase({required this.repos});
  Future<Either<Failure, UserEntity>> call({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required bool agree,
  }) {
    return repos.register(
      username: username,
      email: email,
      phone: phone,
      password: password,
      passwordConfirm: passwordConfirm,
      agree: agree,
    );
  }
}
