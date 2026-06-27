import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/domain/entity/register_entity.dart';
import 'package:test1/features/auth/domain/entity/user_entity.dart';
import 'package:test1/features/auth/domain/usecase/user_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.registerUseCase) : super(AuthInitial());

  final RegisterUseCase registerUseCase;
  String? validateRequired(String value) {
    if (value.trim().isEmpty) return "Required field";
    return null;
  }

  String? validatePasswordMatch(String pass, String confirm) {
    if (pass != confirm) return "Passwords do not match";
    return null;
  }

  Future<void> register(RegisterRequestEntity entity) async {
    emit(AuthLoading());

    final result = await registerUseCase(entity);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthLoaded(user)),
    );
  }
}
