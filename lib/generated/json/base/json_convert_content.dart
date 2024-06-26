// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:fl_audio_book/pages/auth/model/login_screen_response_entity.dart';
import 'package:fl_audio_book/pages/bhajans/bhajan_list_response_entity.dart';
import 'package:fl_audio_book/pages/newRelease/new_release_video_list_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(LoginScreenResponseEntity).toString(): LoginScreenResponseEntity.fromJson,
		(LoginScreenResponseUser).toString(): LoginScreenResponseUser.fromJson,
		(BhajanListResponseEntity).toString(): BhajanListResponseEntity.fromJson,
		(BhajanListResponseResult).toString(): BhajanListResponseResult.fromJson,
		(BhajanListResponseResultPoster).toString(): BhajanListResponseResultPoster.fromJson,
		(BhajanListResponseResultPosterOriginFileObj).toString(): BhajanListResponseResultPosterOriginFileObj.fromJson,
		(BhajanListResponseResultPosterResponse).toString(): BhajanListResponseResultPosterResponse.fromJson,
		(BhajanListResponseResultPosterResponseFile).toString(): BhajanListResponseResultPosterResponseFile.fromJson,
		(BhajanListResponseResultAudio).toString(): BhajanListResponseResultAudio.fromJson,
		(BhajanListResponseResultAudioOriginFileObj).toString(): BhajanListResponseResultAudioOriginFileObj.fromJson,
		(BhajanListResponseResultAudioResponse).toString(): BhajanListResponseResultAudioResponse.fromJson,
		(BhajanListResponseResultAudioResponseAudio).toString(): BhajanListResponseResultAudioResponseAudio.fromJson,
		(BhajanListResponsePagination).toString(): BhajanListResponsePagination.fromJson,
		(NewReleaseVideoListEntity).toString(): NewReleaseVideoListEntity.fromJson,
		(NewReleaseVideoListResult).toString(): NewReleaseVideoListResult.fromJson,
		(NewReleaseVideoListPagination).toString(): NewReleaseVideoListPagination.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if(value == null){
      return null;
    }
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<LoginScreenResponseEntity>[] is M){
			return data.map<LoginScreenResponseEntity>((Map<String, dynamic> e) => LoginScreenResponseEntity.fromJson(e)).toList() as M;
		}
		if(<LoginScreenResponseUser>[] is M){
			return data.map<LoginScreenResponseUser>((Map<String, dynamic> e) => LoginScreenResponseUser.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseEntity>[] is M){
			return data.map<BhajanListResponseEntity>((Map<String, dynamic> e) => BhajanListResponseEntity.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResult>[] is M){
			return data.map<BhajanListResponseResult>((Map<String, dynamic> e) => BhajanListResponseResult.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultPoster>[] is M){
			return data.map<BhajanListResponseResultPoster>((Map<String, dynamic> e) => BhajanListResponseResultPoster.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultPosterOriginFileObj>[] is M){
			return data.map<BhajanListResponseResultPosterOriginFileObj>((Map<String, dynamic> e) => BhajanListResponseResultPosterOriginFileObj.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultPosterResponse>[] is M){
			return data.map<BhajanListResponseResultPosterResponse>((Map<String, dynamic> e) => BhajanListResponseResultPosterResponse.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultPosterResponseFile>[] is M){
			return data.map<BhajanListResponseResultPosterResponseFile>((Map<String, dynamic> e) => BhajanListResponseResultPosterResponseFile.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultAudio>[] is M){
			return data.map<BhajanListResponseResultAudio>((Map<String, dynamic> e) => BhajanListResponseResultAudio.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultAudioOriginFileObj>[] is M){
			return data.map<BhajanListResponseResultAudioOriginFileObj>((Map<String, dynamic> e) => BhajanListResponseResultAudioOriginFileObj.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultAudioResponse>[] is M){
			return data.map<BhajanListResponseResultAudioResponse>((Map<String, dynamic> e) => BhajanListResponseResultAudioResponse.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponseResultAudioResponseAudio>[] is M){
			return data.map<BhajanListResponseResultAudioResponseAudio>((Map<String, dynamic> e) => BhajanListResponseResultAudioResponseAudio.fromJson(e)).toList() as M;
		}
		if(<BhajanListResponsePagination>[] is M){
			return data.map<BhajanListResponsePagination>((Map<String, dynamic> e) => BhajanListResponsePagination.fromJson(e)).toList() as M;
		}
		if(<NewReleaseVideoListEntity>[] is M){
			return data.map<NewReleaseVideoListEntity>((Map<String, dynamic> e) => NewReleaseVideoListEntity.fromJson(e)).toList() as M;
		}
		if(<NewReleaseVideoListResult>[] is M){
			return data.map<NewReleaseVideoListResult>((Map<String, dynamic> e) => NewReleaseVideoListResult.fromJson(e)).toList() as M;
		}
		if(<NewReleaseVideoListPagination>[] is M){
			return data.map<NewReleaseVideoListPagination>((Map<String, dynamic> e) => NewReleaseVideoListPagination.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}