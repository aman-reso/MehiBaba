import 'package:fl_audio_book/pages/ebooks/ebook_list_response.dart';

import '../../network/ApiService.dart';
import '../home/model/home_page_response_model.dart';

class EbookManager {
  static Future<EbookListResponse> getAllEBooks() async {
    var allCategoryUrl = "http://165.227.67.154:8888/api/ebooks/list";
    var response = await ApiService.fetchData<Map<String, dynamic>>(allCategoryUrl);
    return EbookListResponse.fromJson(response);}
}
