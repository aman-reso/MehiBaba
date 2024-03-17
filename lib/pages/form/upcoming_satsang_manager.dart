import 'package:fl_audio_book/network/ApiService.dart';

class UpComingSatsangManager {
  static var url = "http://165.227.67.154:8888/api/bookedsatsang/create";

  static Future<dynamic> submitUpComingSatsangForm(String satSangId) async {
    var data = <String, dynamic>{};
    data["upcomingSatsangId"]=satSangId;
    data["userId"]='1';
    return ApiService.postData(url, data);
  }
}
