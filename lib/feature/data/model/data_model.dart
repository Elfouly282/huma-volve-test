import 'package:test1/feature/data/model/user_model.dart';

class DataModel {
  final UserModel user;
  final String token;

  DataModel({required this.user, required this.token});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      user: UserModel.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': user.toJson(), 'token': token};
  }
}
