import 'package:fl_audio_book/generated/json/base/json_field.dart';
import 'package:fl_audio_book/generated/json/new_release_video_list_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NewReleaseVideoListEntity {

	late bool success;
	late List<NewReleaseVideoListResult> result;
	late NewReleaseVideoListPagination pagination;
	late String message;
  
  NewReleaseVideoListEntity();

  factory NewReleaseVideoListEntity.fromJson(Map<String, dynamic> json) => $NewReleaseVideoListEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewReleaseVideoListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewReleaseVideoListResult {

	late bool enabled;
	@JSONField(name: "_id")
	late String sId;
	late String title;
	late String youtubeUrl;
	late String contentType;
	late String category;
	@JSONField(name: "__v")
	late int iV;
  
  NewReleaseVideoListResult();

  factory NewReleaseVideoListResult.fromJson(Map<String, dynamic> json) => $NewReleaseVideoListResultFromJson(json);

  Map<String, dynamic> toJson() => $NewReleaseVideoListResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewReleaseVideoListPagination {

	late int page;
	late int pages;
	late int count;
  
  NewReleaseVideoListPagination();

  factory NewReleaseVideoListPagination.fromJson(Map<String, dynamic> json) => $NewReleaseVideoListPaginationFromJson(json);

  Map<String, dynamic> toJson() => $NewReleaseVideoListPaginationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}