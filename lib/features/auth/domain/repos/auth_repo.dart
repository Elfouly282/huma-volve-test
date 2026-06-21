
import 'package:dartz/dartz.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/domain/entities/user_entity.dart';
import 'package:test1/features/auth/domain/use_cases/register_params.dart';

 abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterParams params);
}
