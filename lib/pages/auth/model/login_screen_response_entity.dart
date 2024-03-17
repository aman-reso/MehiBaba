import 'package:fl_audio_book/generated/json/base/json_field.dart';
import 'package:fl_audio_book/generated/json/login_screen_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginScreenResponseEntity {

	late bool success;
	late String message;
	late String token;
	late LoginScreenResponseUser user;
  
  LoginScreenResponseEntity();

  factory LoginScreenResponseEntity.fromJson(Map<String, dynamic> json) => $LoginScreenResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginScreenResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginScreenResponseUser {

	@JSONField(name: "_id")
	late String sId;
	late bool enabled;
	late String number;
	late String name;
  
  LoginScreenResponseUser();

  factory LoginScreenResponseUser.fromJson(Map<String, dynamic> json) => $LoginScreenResponseUserFromJson(json);

  Map<String, dynamic> toJson() => $LoginScreenResponseUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}