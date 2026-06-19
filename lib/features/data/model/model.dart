-import 'package:json_annotation/json_annotation.dart';

part '../web_services/register_model.g.dart';

@JsonSerializable()
class RegisterRequestBody {
@JsonKey(name: "name")
final String name;
@JsonKey(name: "email")
final String email;
@JsonKey(name: "password")
final String password;
@JsonKey(name: "password_confirmation")
final String? passwordConfirmation;

RegisterRequestBody({
required this.name,
required this.email,
required this.password,
this.passwordConfirmation,
});

factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
_$RegisterRequestBodyFromJson(json);

Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}

@JsonSerializable()
class RegisterResponse {
@JsonKey(name: "status")
final bool? status;
@JsonKey(name: "message")
final String? message;
@JsonKey(name: "data")
final UserData? data;

RegisterResponse({this.status, this.message, this.data});

factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
_$RegisterResponseFromJson(json);

Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class UserData {
@JsonKey(name: "id")
final int? id;
@JsonKey(name: "name")
final String? name;
@JsonKey(name: "email")
final String? email;
@JsonKey(name: "token")
final String? token;

UserData({this.id, this.name, this.email, this.token});

factory UserData.fromJson(Map<String, dynamic> json) =>
_$UserDataFromJson(json);

Map<String, dynamic> toJson() => _$UserDataToJson(this);
}