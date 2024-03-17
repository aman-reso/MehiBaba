import 'package:fl_audio_book/generated/json/base/json_convert_content.dart';
import 'package:fl_audio_book/pages/bhajans/bhajan_list_response_entity.dart';

BhajanListResponseEntity $BhajanListResponseEntityFromJson(Map<String, dynamic> json) {
	final BhajanListResponseEntity bhajanListResponseEntity = BhajanListResponseEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		bhajanListResponseEntity.success = success;
	}
	final List<BhajanListResponseResult>? result = jsonConvert.convertListNotNull<BhajanListResponseResult>(json['result']);
	if (result != null) {
		bhajanListResponseEntity.result = result;
	}
	final BhajanListResponsePagination? pagination = jsonConvert.convert<BhajanListResponsePagination>(json['pagination']);
	if (pagination != null) {
		bhajanListResponseEntity.pagination = pagination;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		bhajanListResponseEntity.message = message;
	}
	return bhajanListResponseEntity;
}

Map<String, dynamic> $BhajanListResponseEntityToJson(BhajanListResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['result'] =  entity.result.map((v) => v.toJson()).toList();
	data['pagination'] = entity.pagination.toJson();
	data['message'] = entity.message;
	return data;
}

BhajanListResponseResult $BhajanListResponseResultFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResult bhajanListResponseResult = BhajanListResponseResult();
	final List<BhajanListResponseResultPoster>? poster = jsonConvert.convertListNotNull<BhajanListResponseResultPoster>(json['poster']);
	if (poster != null) {
		bhajanListResponseResult.poster = poster;
	}
	final List<BhajanListResponseResultAudio>? audio = jsonConvert.convertListNotNull<BhajanListResponseResultAudio>(json['audio']);
	if (audio != null) {
		bhajanListResponseResult.audio = audio;
	}
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		bhajanListResponseResult.sId = sId;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		bhajanListResponseResult.title = title;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		bhajanListResponseResult.description = description;
	}
	final int? iV = jsonConvert.convert<int>(json['__v']);
	if (iV != null) {
		bhajanListResponseResult.iV = iV;
	}
	return bhajanListResponseResult;
}

Map<String, dynamic> $BhajanListResponseResultToJson(BhajanListResponseResult entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['poster'] =  entity.poster.map((v) => v.toJson()).toList();
	data['audio'] =  entity.audio.map((v) => v.toJson()).toList();
	data['_id'] = entity.sId;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['__v'] = entity.iV;
	return data;
}

BhajanListResponseResultPoster $BhajanListResponseResultPosterFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultPoster bhajanListResponseResultPoster = BhajanListResponseResultPoster();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		bhajanListResponseResultPoster.uid = uid;
	}
	final int? lastModified = jsonConvert.convert<int>(json['lastModified']);
	if (lastModified != null) {
		bhajanListResponseResultPoster.lastModified = lastModified;
	}
	final String? lastModifiedDate = jsonConvert.convert<String>(json['lastModifiedDate']);
	if (lastModifiedDate != null) {
		bhajanListResponseResultPoster.lastModifiedDate = lastModifiedDate;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		bhajanListResponseResultPoster.name = name;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		bhajanListResponseResultPoster.size = size;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		bhajanListResponseResultPoster.type = type;
	}
	final int? percent = jsonConvert.convert<int>(json['percent']);
	if (percent != null) {
		bhajanListResponseResultPoster.percent = percent;
	}
	final BhajanListResponseResultPosterOriginFileObj? originFileObj = jsonConvert.convert<BhajanListResponseResultPosterOriginFileObj>(json['originFileObj']);
	if (originFileObj != null) {
		bhajanListResponseResultPoster.originFileObj = originFileObj;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		bhajanListResponseResultPoster.status = status;
	}
	final BhajanListResponseResultPosterResponse? response = jsonConvert.convert<BhajanListResponseResultPosterResponse>(json['response']);
	if (response != null) {
		bhajanListResponseResultPoster.response = response;
	}
	return bhajanListResponseResultPoster;
}

Map<String, dynamic> $BhajanListResponseResultPosterToJson(BhajanListResponseResultPoster entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	data['lastModified'] = entity.lastModified;
	data['lastModifiedDate'] = entity.lastModifiedDate;
	data['name'] = entity.name;
	data['size'] = entity.size;
	data['type'] = entity.type;
	data['percent'] = entity.percent;
	data['originFileObj'] = entity.originFileObj.toJson();
	data['status'] = entity.status;
	data['response'] = entity.response.toJson();
	return data;
}

BhajanListResponseResultPosterOriginFileObj $BhajanListResponseResultPosterOriginFileObjFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultPosterOriginFileObj bhajanListResponseResultPosterOriginFileObj = BhajanListResponseResultPosterOriginFileObj();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		bhajanListResponseResultPosterOriginFileObj.uid = uid;
	}
	return bhajanListResponseResultPosterOriginFileObj;
}

Map<String, dynamic> $BhajanListResponseResultPosterOriginFileObjToJson(BhajanListResponseResultPosterOriginFileObj entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	return data;
}

BhajanListResponseResultPosterResponse $BhajanListResponseResultPosterResponseFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultPosterResponse bhajanListResponseResultPosterResponse = BhajanListResponseResultPosterResponse();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		bhajanListResponseResultPosterResponse.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		bhajanListResponseResultPosterResponse.message = message;
	}
	final BhajanListResponseResultPosterResponseFile? file = jsonConvert.convert<BhajanListResponseResultPosterResponseFile>(json['file']);
	if (file != null) {
		bhajanListResponseResultPosterResponse.file = file;
	}
	return bhajanListResponseResultPosterResponse;
}

Map<String, dynamic> $BhajanListResponseResultPosterResponseToJson(BhajanListResponseResultPosterResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['file'] = entity.file.toJson();
	return data;
}

BhajanListResponseResultPosterResponseFile $BhajanListResponseResultPosterResponseFileFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultPosterResponseFile bhajanListResponseResultPosterResponseFile = BhajanListResponseResultPosterResponseFile();
	final String? fieldname = jsonConvert.convert<String>(json['fieldname']);
	if (fieldname != null) {
		bhajanListResponseResultPosterResponseFile.fieldname = fieldname;
	}
	final String? originalname = jsonConvert.convert<String>(json['originalname']);
	if (originalname != null) {
		bhajanListResponseResultPosterResponseFile.originalname = originalname;
	}
	final String? encoding = jsonConvert.convert<String>(json['encoding']);
	if (encoding != null) {
		bhajanListResponseResultPosterResponseFile.encoding = encoding;
	}
	final String? mimetype = jsonConvert.convert<String>(json['mimetype']);
	if (mimetype != null) {
		bhajanListResponseResultPosterResponseFile.mimetype = mimetype;
	}
	final String? destination = jsonConvert.convert<String>(json['destination']);
	if (destination != null) {
		bhajanListResponseResultPosterResponseFile.destination = destination;
	}
	final String? filename = jsonConvert.convert<String>(json['filename']);
	if (filename != null) {
		bhajanListResponseResultPosterResponseFile.filename = filename;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		bhajanListResponseResultPosterResponseFile.path = path;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		bhajanListResponseResultPosterResponseFile.size = size;
	}
	return bhajanListResponseResultPosterResponseFile;
}

Map<String, dynamic> $BhajanListResponseResultPosterResponseFileToJson(BhajanListResponseResultPosterResponseFile entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['fieldname'] = entity.fieldname;
	data['originalname'] = entity.originalname;
	data['encoding'] = entity.encoding;
	data['mimetype'] = entity.mimetype;
	data['destination'] = entity.destination;
	data['filename'] = entity.filename;
	data['path'] = entity.path;
	data['size'] = entity.size;
	return data;
}

BhajanListResponseResultAudio $BhajanListResponseResultAudioFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultAudio bhajanListResponseResultAudio = BhajanListResponseResultAudio();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		bhajanListResponseResultAudio.uid = uid;
	}
	final int? lastModified = jsonConvert.convert<int>(json['lastModified']);
	if (lastModified != null) {
		bhajanListResponseResultAudio.lastModified = lastModified;
	}
	final String? lastModifiedDate = jsonConvert.convert<String>(json['lastModifiedDate']);
	if (lastModifiedDate != null) {
		bhajanListResponseResultAudio.lastModifiedDate = lastModifiedDate;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		bhajanListResponseResultAudio.name = name;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		bhajanListResponseResultAudio.size = size;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		bhajanListResponseResultAudio.type = type;
	}
	final int? percent = jsonConvert.convert<int>(json['percent']);
	if (percent != null) {
		bhajanListResponseResultAudio.percent = percent;
	}
	final BhajanListResponseResultAudioOriginFileObj? originFileObj = jsonConvert.convert<BhajanListResponseResultAudioOriginFileObj>(json['originFileObj']);
	if (originFileObj != null) {
		bhajanListResponseResultAudio.originFileObj = originFileObj;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		bhajanListResponseResultAudio.status = status;
	}
	final BhajanListResponseResultAudioResponse? response = jsonConvert.convert<BhajanListResponseResultAudioResponse>(json['response']);
	if (response != null) {
		bhajanListResponseResultAudio.response = response;
	}
	return bhajanListResponseResultAudio;
}

Map<String, dynamic> $BhajanListResponseResultAudioToJson(BhajanListResponseResultAudio entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	data['lastModified'] = entity.lastModified;
	data['lastModifiedDate'] = entity.lastModifiedDate;
	data['name'] = entity.name;
	data['size'] = entity.size;
	data['type'] = entity.type;
	data['percent'] = entity.percent;
	data['originFileObj'] = entity.originFileObj.toJson();
	data['status'] = entity.status;
	data['response'] = entity.response.toJson();
	return data;
}

BhajanListResponseResultAudioOriginFileObj $BhajanListResponseResultAudioOriginFileObjFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultAudioOriginFileObj bhajanListResponseResultAudioOriginFileObj = BhajanListResponseResultAudioOriginFileObj();
	final String? uid = jsonConvert.convert<String>(json['uid']);
	if (uid != null) {
		bhajanListResponseResultAudioOriginFileObj.uid = uid;
	}
	return bhajanListResponseResultAudioOriginFileObj;
}

Map<String, dynamic> $BhajanListResponseResultAudioOriginFileObjToJson(BhajanListResponseResultAudioOriginFileObj entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['uid'] = entity.uid;
	return data;
}

BhajanListResponseResultAudioResponse $BhajanListResponseResultAudioResponseFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultAudioResponse bhajanListResponseResultAudioResponse = BhajanListResponseResultAudioResponse();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		bhajanListResponseResultAudioResponse.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		bhajanListResponseResultAudioResponse.message = message;
	}
	final BhajanListResponseResultAudioResponseAudio? audio = jsonConvert.convert<BhajanListResponseResultAudioResponseAudio>(json['audio']);
	if (audio != null) {
		bhajanListResponseResultAudioResponse.audio = audio;
	}
	return bhajanListResponseResultAudioResponse;
}

Map<String, dynamic> $BhajanListResponseResultAudioResponseToJson(BhajanListResponseResultAudioResponse entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['audio'] = entity.audio.toJson();
	return data;
}

BhajanListResponseResultAudioResponseAudio $BhajanListResponseResultAudioResponseAudioFromJson(Map<String, dynamic> json) {
	final BhajanListResponseResultAudioResponseAudio bhajanListResponseResultAudioResponseAudio = BhajanListResponseResultAudioResponseAudio();
	final String? fieldname = jsonConvert.convert<String>(json['fieldname']);
	if (fieldname != null) {
		bhajanListResponseResultAudioResponseAudio.fieldname = fieldname;
	}
	final String? originalname = jsonConvert.convert<String>(json['originalname']);
	if (originalname != null) {
		bhajanListResponseResultAudioResponseAudio.originalname = originalname;
	}
	final String? encoding = jsonConvert.convert<String>(json['encoding']);
	if (encoding != null) {
		bhajanListResponseResultAudioResponseAudio.encoding = encoding;
	}
	final String? mimetype = jsonConvert.convert<String>(json['mimetype']);
	if (mimetype != null) {
		bhajanListResponseResultAudioResponseAudio.mimetype = mimetype;
	}
	final String? destination = jsonConvert.convert<String>(json['destination']);
	if (destination != null) {
		bhajanListResponseResultAudioResponseAudio.destination = destination;
	}
	final String? filename = jsonConvert.convert<String>(json['filename']);
	if (filename != null) {
		bhajanListResponseResultAudioResponseAudio.filename = filename;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		bhajanListResponseResultAudioResponseAudio.path = path;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		bhajanListResponseResultAudioResponseAudio.size = size;
	}
	return bhajanListResponseResultAudioResponseAudio;
}

Map<String, dynamic> $BhajanListResponseResultAudioResponseAudioToJson(BhajanListResponseResultAudioResponseAudio entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['fieldname'] = entity.fieldname;
	data['originalname'] = entity.originalname;
	data['encoding'] = entity.encoding;
	data['mimetype'] = entity.mimetype;
	data['destination'] = entity.destination;
	data['filename'] = entity.filename;
	data['path'] = entity.path;
	data['size'] = entity.size;
	return data;
}

BhajanListResponsePagination $BhajanListResponsePaginationFromJson(Map<String, dynamic> json) {
	final BhajanListResponsePagination bhajanListResponsePagination = BhajanListResponsePagination();
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		bhajanListResponsePagination.page = page;
	}
	final int? pages = jsonConvert.convert<int>(json['pages']);
	if (pages != null) {
		bhajanListResponsePagination.pages = pages;
	}
	final int? count = jsonConvert.convert<int>(json['count']);
	if (count != null) {
		bhajanListResponsePagination.count = count;
	}
	return bhajanListResponsePagination;
}

Map<String, dynamic> $BhajanListResponsePaginationToJson(BhajanListResponsePagination entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['page'] = entity.page;
	data['pages'] = entity.pages;
	data['count'] = entity.count;
	return data;
}