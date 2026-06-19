import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/register_model.dart';
import '../repos/auth_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState<RegisterResponse>> {
  final AuthRepo _authRepo;

  RegisterCubit(this._authRepo) : super(const RegisterState.initial());

  void emitRegisterStates(RegisterRequestBody registerRequestBody) async {
    emit(const RegisterState.loading());
    try {
      final response = await _authRepo.register(registerRequestBody);
      emit(RegisterState.success(response));
    } catch (error) {
      emit(RegisterState.error(error: error.toString()));
    }
  }
}