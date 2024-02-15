import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
part 'signin_payload.g.dart';

SignInPayload signInPayloadFromJson(String str) =>
    SignInPayload.fromJson(json.decode(str));

String signInPayloadToJson(SignInPayload data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class SignInPayload {
  @HiveField(0)
  final int code;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final Data data;

  SignInPayload({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SignInPayload.fromJson(Map<String, dynamic> json) => SignInPayload(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String avartar;
  @HiveField(3)
  final String role;

  Data({
    required this.name,
    required this.id,
    required this.avartar,
    required this.role,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        id: json["_id"],
        avartar: json["avartar"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
        "avartar": avartar,
        "role": role,
      };
}
