import 'package:test1/features/auth/domain/entities/user_entity.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final UserEntity entity;
  AuthLoaded({required this.entity});
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
