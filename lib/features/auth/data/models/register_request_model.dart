class RegisterRequestModel {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const RegisterRequestModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'agree_terms': 1,
      };
}
 