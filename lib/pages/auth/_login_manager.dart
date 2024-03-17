import 'package:fl_audio_book/network/ApiService.dart';
import 'package:flutter/foundation.dart';

import 'model/login_screen_response_entity.dart';

class LoginManager {
  static String phoneNumber = "";
  static String userName = "";

  static Future createUser(String number, String name) async {
    phoneNumber = number;
    userName = name;
    var url = "http://165.227.67.154:8888/api/users/create";
    Map<String, dynamic> data = {"number": number, "name": name};
    var response = ApiService.postData<Map<String, dynamic>>(url, data);
    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  static Future<LoginScreenResponseEntity> verifyOtp(String number, String otp) async {
    try {
      var url = "http://165.227.67.154:8888/api/users/verify";
      Map<String, dynamic> data = {"number": phoneNumber, "otp": otp};
      var response = await ApiService.postData<Map<String, dynamic>>(url, data);
      return LoginScreenResponseEntity.fromJson(response);
    } catch (e) {
      throw Exception("Something went wrong:-$e");
    }
  }
}
