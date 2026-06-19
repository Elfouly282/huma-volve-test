import 'package:dartz/dartz.dart';
import 'package:test1/core/utils/failure.dart';
import 'package:test1/feature/domain/entities/auth_entity.dart';
import 'package:test1/feature/domain/repositories/auth_repo.dart';


class RegisterUseCase {
  final AuthRepo repo;

  RegisterUseCase(this.repo);

  Future<Either<Failure, AuthEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repo.registerUser(name: name, email: email, password: password);
  }
}
