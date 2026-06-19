import 'package:test1/feature/domain/entities/auth_entity.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthEntity data;

  AuthSuccess(this.data);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
