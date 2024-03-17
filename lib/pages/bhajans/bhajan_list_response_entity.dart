import 'package:fl_audio_book/generated/json/base/json_field.dart';
import 'package:fl_audio_book/generated/json/bhajan_list_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BhajanListResponseEntity {

	late bool success;
	late List<BhajanListResponseResult> result;
	late BhajanListResponsePagination pagination;
	late String message;
  
  BhajanListResponseEntity();

  factory BhajanListResponseEntity.fromJson(Map<String, dynamic> json) => $BhajanListResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResult {

	late List<BhajanListResponseResultPoster> poster;
	late List<BhajanListResponseResultAudio> audio;
	@JSONField(name: "_id")
	late String sId;
	late String title;
	late String description;
	@JSONField(name: "__v")
	late int iV;
  
  BhajanListResponseResult();

  factory BhajanListResponseResult.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultPoster {

	late String uid;
	late int lastModified;
	late String lastModifiedDate;
	late String name;
	late int size;
	late String type;
	late int percent;
	late BhajanListResponseResultPosterOriginFileObj originFileObj;
	late String status;
	late BhajanListResponseResultPosterResponse response;
  
  BhajanListResponseResultPoster();

  factory BhajanListResponseResultPoster.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultPosterFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultPosterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultPosterOriginFileObj {

	late String uid;
  
  BhajanListResponseResultPosterOriginFileObj();

  factory BhajanListResponseResultPosterOriginFileObj.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultPosterOriginFileObjFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultPosterOriginFileObjToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultPosterResponse {

	late bool success;
	late String message;
	late BhajanListResponseResultPosterResponseFile file;
  
  BhajanListResponseResultPosterResponse();

  factory BhajanListResponseResultPosterResponse.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultPosterResponseFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultPosterResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultPosterResponseFile {

	late String fieldname;
	late String originalname;
	late String encoding;
	late String mimetype;
	late String destination;
	late String filename;
	late String path;
	late int size;
  
  BhajanListResponseResultPosterResponseFile();

  factory BhajanListResponseResultPosterResponseFile.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultPosterResponseFileFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultPosterResponseFileToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultAudio {

	late String uid;
	late int lastModified;
	late String lastModifiedDate;
	late String name;
	late int size;
	late String type;
	late int percent;
	late BhajanListResponseResultAudioOriginFileObj originFileObj;
	late String status;
	late BhajanListResponseResultAudioResponse response;
  
  BhajanListResponseResultAudio();

  factory BhajanListResponseResultAudio.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultAudioFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultAudioToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultAudioOriginFileObj {

	late String uid;
  
  BhajanListResponseResultAudioOriginFileObj();

  factory BhajanListResponseResultAudioOriginFileObj.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultAudioOriginFileObjFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultAudioOriginFileObjToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultAudioResponse {

	late bool success;
	late String message;
	late BhajanListResponseResultAudioResponseAudio audio;
  
  BhajanListResponseResultAudioResponse();

  factory BhajanListResponseResultAudioResponse.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultAudioResponseFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultAudioResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponseResultAudioResponseAudio {

	late String fieldname;
	late String originalname;
	late String encoding;
	late String mimetype;
	late String destination;
	late String filename;
	late String path;
	late int size;
  
  BhajanListResponseResultAudioResponseAudio();

  factory BhajanListResponseResultAudioResponseAudio.fromJson(Map<String, dynamic> json) => $BhajanListResponseResultAudioResponseAudioFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponseResultAudioResponseAudioToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BhajanListResponsePagination {

	late int page;
	late int pages;
	late int count;
  
  BhajanListResponsePagination();

  factory BhajanListResponsePagination.fromJson(Map<String, dynamic> json) => $BhajanListResponsePaginationFromJson(json);

  Map<String, dynamic> toJson() => $BhajanListResponsePaginationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}