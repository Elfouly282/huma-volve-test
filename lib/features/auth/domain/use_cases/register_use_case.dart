import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';
import 'package:test1/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<Either<Failure, UserEntity>> call({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) {
    return authRepo.register(
      username: username,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
