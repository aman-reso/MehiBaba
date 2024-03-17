import 'package:fl_audio_book/network/ApiService.dart';
import 'package:flutter/foundation.dart';

import 'category_response.dart';

class CategoryManager {
  static  Future<ApiResponse> getAllCategory() async {
    var allCategoryUrl = "http://165.227.67.154:8888/api/category/list";
    var response = await ApiService.fetchData<Map<String, dynamic>>(allCategoryUrl);
    return ApiResponse.fromJson(response);
  }
}
