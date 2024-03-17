
import 'package:fl_audio_book/pages/home/model/home_page_response_model.dart';

class EbookListResponse {
  final bool success;
  final List<Ebook> result;
  final String message;

  EbookListResponse({
    required this.success,
    required this.result,
    required this.message,
  });

  factory EbookListResponse.fromJson(Map<String, dynamic> json) {
    return EbookListResponse(
      success: json['success'],
      result: (json['result'] as List).map((e) => Ebook.fromJson(e)).toList(),
      message: json['message'],
    );
  }
}

class Document {
  final Pagination pagination;
  final String message;

  Document({
    required this.pagination,
    required this.message,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      pagination: Pagination.fromJson(json['pagination']),
      message: json['message'],
    );
  }
}

class Pagination {
  final int page;
  final int pages;
  final int count;

  Pagination({
    required this.page,
    required this.pages,
    required this.count,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pages: json['pages'],
      count: json['count'],
    );
  }
}
