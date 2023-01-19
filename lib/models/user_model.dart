// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.imgUrl,
    this.fcmToken,
    this.email,
    this.password,
  });

  String? id;
  String? userId;
  String? name;
  String? phone;
  String? imgUrl;
  String? fcmToken;
  String? email;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        phone: json["phone"],
        imgUrl: json["imgUrl"],
        fcmToken: json["fcm_token"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone": phone,
        "imgUrl": imgUrl,
        "fcm_token": fcmToken,
        "email": email,
        "password": password,
      };
}
