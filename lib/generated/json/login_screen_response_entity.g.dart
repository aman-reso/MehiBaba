import 'package:fl_audio_book/generated/json/base/json_convert_content.dart';
import 'package:fl_audio_book/pages/auth/model/login_screen_response_entity.dart';

LoginScreenResponseEntity $LoginScreenResponseEntityFromJson(Map<String, dynamic> json) {
	final LoginScreenResponseEntity loginScreenResponseEntity = LoginScreenResponseEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		loginScreenResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		loginScreenResponseEntity.message = message;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		loginScreenResponseEntity.token = token;
	}
	final LoginScreenResponseUser? user = jsonConvert.convert<LoginScreenResponseUser>(json['user']);
	if (user != null) {
		loginScreenResponseEntity.user = user;
	}
	return loginScreenResponseEntity;
}

Map<String, dynamic> $LoginScreenResponseEntityToJson(LoginScreenResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['token'] = entity.token;
	data['user'] = entity.user.toJson();
	return data;
}

LoginScreenResponseUser $LoginScreenResponseUserFromJson(Map<String, dynamic> json) {
	final LoginScreenResponseUser loginScreenResponseUser = LoginScreenResponseUser();
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		loginScreenResponseUser.sId = sId;
	}
	final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
	if (enabled != null) {
		loginScreenResponseUser.enabled = enabled;
	}
	final String? number = jsonConvert.convert<String>(json['number']);
	if (number != null) {
		loginScreenResponseUser.number = number;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		loginScreenResponseUser.name = name;
	}
	return loginScreenResponseUser;
}

Map<String, dynamic> $LoginScreenResponseUserToJson(LoginScreenResponseUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_id'] = entity.sId;
	data['enabled'] = entity.enabled;
	data['number'] = entity.number;
	data['name'] = entity.name;
	return data;
}