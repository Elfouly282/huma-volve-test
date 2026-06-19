import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/user_entity.dart';
import '../../data/model/register_request_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequestModel request);
}
