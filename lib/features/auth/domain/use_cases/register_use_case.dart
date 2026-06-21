
import 'package:dartz/dartz.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';
import 'package:test1/features/auth/domain/repos/auth_repo.dart';
import 'package:test1/features/auth/domain/use_cases/register_params.dart';

  class RegisterUseCase {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call(RegisterParams params) =>
      _repository.register(params);
}
