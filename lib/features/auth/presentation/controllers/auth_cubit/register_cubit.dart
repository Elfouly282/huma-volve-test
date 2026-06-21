import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/auth/domain/use_cases/register_params.dart';
import 'package:test1/features/auth/domain/use_cases/register_use_case.dart';
import 'package:test1/features/auth/presentation/controllers/auth_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(RegisterInitial());


  Future<void> register({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoading());

     final params = RegisterParams(
      username: username,
      email: email,
      phone: phone,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    final result = await _registerUseCase(params);

    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
