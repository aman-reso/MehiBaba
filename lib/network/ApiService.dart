import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static final Dio _dio = Dio();

  static Future<T> fetchData<T>(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      if (response.statusCode == 200) {
        return response.data as T;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {

      if (kDebugMode) {
        print(e);
      }
      throw Exception('Failed to connect to the server');
    }
  }

  static Future<T> postData<T>(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      if (response.statusCode == 200) {
        print(response);
        return response.data;
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to connect to the server');
    }
  }
}
