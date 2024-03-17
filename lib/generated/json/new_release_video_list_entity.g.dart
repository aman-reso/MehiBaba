import 'package:fl_audio_book/generated/json/base/json_convert_content.dart';
import 'package:fl_audio_book/pages/newRelease/new_release_video_list_entity.dart';

NewReleaseVideoListEntity $NewReleaseVideoListEntityFromJson(Map<String, dynamic> json) {
	final NewReleaseVideoListEntity newReleaseVideoListEntity = NewReleaseVideoListEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		newReleaseVideoListEntity.success = success;
	}
	final List<NewReleaseVideoListResult>? result = jsonConvert.convertListNotNull<NewReleaseVideoListResult>(json['result']);
	if (result != null) {
		newReleaseVideoListEntity.result = result;
	}
	final NewReleaseVideoListPagination? pagination = jsonConvert.convert<NewReleaseVideoListPagination>(json['pagination']);
	if (pagination != null) {
		newReleaseVideoListEntity.pagination = pagination;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		newReleaseVideoListEntity.message = message;
	}
	return newReleaseVideoListEntity;
}

Map<String, dynamic> $NewReleaseVideoListEntityToJson(NewReleaseVideoListEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['result'] =  entity.result.map((v) => v.toJson()).toList();
	data['pagination'] = entity.pagination.toJson();
	data['message'] = entity.message;
	return data;
}

NewReleaseVideoListResult $NewReleaseVideoListResultFromJson(Map<String, dynamic> json) {
	final NewReleaseVideoListResult newReleaseVideoListResult = NewReleaseVideoListResult();
	final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
	if (enabled != null) {
		newReleaseVideoListResult.enabled = enabled;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		newReleaseVideoListResult.sId = sId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		newReleaseVideoListResult.title = title;
	}
	final String? youtubeUrl = jsonConvert.convert<String>(json['youtubeUrl']);
	if (youtubeUrl != null) {
		newReleaseVideoListResult.youtubeUrl = youtubeUrl;
	}
	final String? contentType = jsonConvert.convert<String>(json['contentType']);
	if (contentType != null) {
		newReleaseVideoListResult.contentType = contentType;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		newReleaseVideoListResult.category = category;
	}
	final int? iV = jsonConvert.convert<int>(json['__v']);
	if (iV != null) {
		newReleaseVideoListResult.iV = iV;
	}
	return newReleaseVideoListResult;
}

Map<String, dynamic> $NewReleaseVideoListResultToJson(NewReleaseVideoListResult entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['enabled'] = entity.enabled;
	data['_id'] = entity.sId;
	data['title'] = entity.title;
	data['youtubeUrl'] = entity.youtubeUrl;
	data['contentType'] = entity.contentType;
	data['category'] = entity.category;
	data['__v'] = entity.iV;
	return data;
}

NewReleaseVideoListPagination $NewReleaseVideoListPaginationFromJson(Map<String, dynamic> json) {
	final NewReleaseVideoListPagination newReleaseVideoListPagination = NewReleaseVideoListPagination();
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		newReleaseVideoListPagination.page = page;
	}
	final int? pages = jsonConvert.convert<int>(json['pages']);
	if (pages != null) {
		newReleaseVideoListPagination.pages = pages;
	}
	final int? count = jsonConvert.convert<int>(json['count']);
	if (count != null) {
		newReleaseVideoListPagination.count = count;
	}
	return newReleaseVideoListPagination;
}

Map<String, dynamic> $NewReleaseVideoListPaginationToJson(NewReleaseVideoListPagination entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['page'] = entity.page;
	data['pages'] = entity.pages;
	data['count'] = entity.count;
	return data;
}