import 'package:dartz/dartz.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/domain/entity/register_entity.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(RegisterRequestEntity entity) {
    return repository.register(entity);
  }
}
