import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  final bool statu;
  final String? message;
  final String? userId;
  final String? username;

  LoginResponseModel.fromJson(Map<dynamic, dynamic> json)
      : statu = json["STATU"],
        message = json["MESSAGE"] == null ? null : json["MESSAGE"],
        userId = json["USER_ID"] == null ? null : json["USER_ID"],
        username = json["USERNAME"] == null ? null : json["USERNAME"];
}
