class UserModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String createdAt;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['created_at'],
    );
  }
}
