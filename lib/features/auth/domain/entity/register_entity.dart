class RegisterRequestEntity {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final int agreeTerms;

  const RegisterRequestEntity({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.agreeTerms,
  });
}
