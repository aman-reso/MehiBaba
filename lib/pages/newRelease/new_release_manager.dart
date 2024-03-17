import 'package:fl_audio_book/pages/newRelease/new_release_video_list_entity.dart';

import '../../network/ApiService.dart';

class NewReleaseManager {
  static Future<NewReleaseVideoListEntity> getAllNewReleaseVideo() async {
    var allCategoryUrl = "http://165.227.67.154:8888/api/dailyvichar/list";
    var response = await ApiService.fetchData<Map<String, dynamic>>(allCategoryUrl);
    return NewReleaseVideoListEntity.fromJson(response);
  }
}
