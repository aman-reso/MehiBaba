import '../../network/ApiService.dart';
import '../category/category_response.dart';
import 'bhajan_list_response_entity.dart';

class BhajanManager {
  static Future<BhajanListResponseEntity>getAllBhajan() async {
    var allCategoryUrl = "http://165.227.67.154:8888/api/bhajan/list";
    var response = await ApiService.fetchData<Map<String, dynamic>>(allCategoryUrl);
    return BhajanListResponseEntity.fromJson(response);
  }
}
