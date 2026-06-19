import 'package:test1/feature/data/model/data_model.dart';

class RegisterResponseModel {
  final bool success;
  final String message;
  final DataModel data;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: json['success'],
      message: json['message'],
      data: DataModel.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data.toJson()};
  }
}

