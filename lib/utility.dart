class Utility {
  static String extractImageUrl(dynamic obj) {
    const String fileKey = "file";
    if (obj is Map && obj.containsKey(fileKey)) {
      final fileMap = obj[fileKey] as Map?;
      if (fileMap != null && fileMap.containsKey("filename")) {
        return "http://165.227.67.154:8888/file/${fileMap["filename"]}";
      }
    }
    return "";
  }

  static String extractAudioUrl(dynamic obj) {
    const String fileKey = "audio";
    if (obj is Map && obj.containsKey(fileKey)) {
      final fileMap = obj[fileKey] as Map?;
      if (fileMap != null && fileMap.containsKey("filename")) {
        return "http://165.227.67.154:8888/file/${fileMap["filename"]}";
      }
    }
    return "";
  }

  static String extractFile(dynamic obj) {
    const String fileKey = "file";
    if (obj is Map && obj.containsKey(fileKey)) {
      final fileMap = obj[fileKey] as Map?;
      if (fileMap != null && fileMap.containsKey("filename")) {
        return "http://165.227.67.154:8888/file/${fileMap["filename"]}";
      }
    }
    return "";
  }

  static String concatBaseUrl(String endPoint) {
    return "http://165.227.67.154:8888/file/$endPoint";
  }
  static String createYoutubeThumbnail(String youtubeUrl){
    return "https://img.youtube.com/vi/$youtubeUrl/sddefault.jpg";
  }

  static String createBhajanUrl(String fileUrl){
    return "http://165.227.67.154:8888/file/$fileUrl";
  }
}
