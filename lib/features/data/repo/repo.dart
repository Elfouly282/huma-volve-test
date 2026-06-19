import '../models/register_model.dart';
import '../web_services/auth_web_services.dart';

class AuthRepo {
  final AuthWebServices authWebServices;

  AuthRepo({required this.authWebServices});

  Future<RegisterResponse> register(RegisterRequestBody registerRequestBody) async {
    var response = await authWebServices.register(registerRequestBody);
    return response;
  }
}