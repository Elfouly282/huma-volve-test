import 'package:dartz/dartz.dart';
import 'package:test1/core/error/failure.dart';
import 'package:test1/features/auth/domain/entity/register_entity.dart';
import 'package:test1/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequestEntity entity);
}
