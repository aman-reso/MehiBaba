import 'package:fl_audio_book/network/ApiService.dart';
import 'package:fl_audio_book/pages/home/model/home_page_response_model.dart';

class HomePageManager {

  static Future<HomePageResponse>getHomePageData() async {
    var homePageUrl = "http://165.227.67.154:8888/api/home";
    var response = await ApiService.fetchData<Map<String, dynamic>>(homePageUrl);
    return HomePageResponse.fromJson(response);
  }


}
