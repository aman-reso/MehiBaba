import '../home/model/home_page_response_model.dart';

class CategoryResponse {
  final String id;
  final String name;
  List<PosterImage> image;
  final bool enabled;
  final int v;

  CategoryResponse({
    required this.id,
    required this.name,
    required this.image,
    required this.enabled,
    required this.v,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      id: json['_id'],
      name: json['name'],
      image: (json['image'] as List)
          .map((posterImageJson) => PosterImage.fromJson(posterImageJson))
          .toList(),
      enabled: json['enabled'],
      v: json['__v'],
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

class ApiResponse {
  final bool success;
  final List<CategoryResponse> result;
  final Pagination pagination;
  final String message;

  ApiResponse({
    required this.success,
    required this.result,
    required this.pagination,
    required this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      result: (json['result'] as List)
          .map((categoryJson) => CategoryResponse.fromJson(categoryJson))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
      message: json['message'],
    );
  }
}
