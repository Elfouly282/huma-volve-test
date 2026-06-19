class UserEntity {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String createdAt;
  final String token;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.token,
  });
}
