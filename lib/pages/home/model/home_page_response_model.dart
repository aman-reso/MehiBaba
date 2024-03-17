class HomePageResponse {
  bool success;
  ApiData data;

  HomePageResponse({required this.success, required this.data});

  factory HomePageResponse.fromJson(Map<String, dynamic> json) {
    return HomePageResponse(
      success: json['success'],
      data: ApiData.fromJson(json['data']),
    );
  }
}

class ApiData {
  List<Category> categories;
  List<Bhajan>? bhajans;
  List<Ebook> ebooks;
  List<VideoContent> videoContents;
  List<VideoContent>? satsang;
  List<VideoContent>? dailyVichar;
  List<BannerSlider>? banners;
  List<UpComingSatsang>?upcomingsatsang;

  ApiData(
      {required this.categories,
      this.bhajans,
      required this.ebooks,
      required this.videoContents,this.banners,this.dailyVichar,this.satsang,this.upcomingsatsang});

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      categories: (json['categories'] as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList(),
      bhajans: (json['bhajans'] as List)
          .map((bhajanJson) => Bhajan.fromJson(bhajanJson))
          .toList(),
      ebooks: (json['ebooks'] as List)
          .map((ebookJson) => Ebook.fromJson(ebookJson))
          .toList(),
      videoContents: (json['videocontents'] as List)
          .map((videoContentJson) => VideoContent.fromJson(videoContentJson))
          .toList(),
      banners: (json['banners'] as List)
          .map((bannerJson) => BannerSlider.fromJson(bannerJson))
          .toList(),
      dailyVichar: (json['dailyvichar'] as List)
          .map((videoContentJson) => VideoContent.fromJson(videoContentJson))
          .toList(),
      satsang: (json['satsang'] as List)
          .map((videoContentJson) => VideoContent.fromJson(videoContentJson))
          .toList(),
      upcomingsatsang: (json['upcomingsatsang'] as List)
          .map((upComingSatsang) => UpComingSatsang.fromJson(upComingSatsang))
          .toList()
    );
  }
}

class Category {
  List<PosterImage>  image;
  bool enabled;
  String id;
  String name;
  int v;

  Category(
      {required this.image,
      required this.enabled,
      required this.id,
      required this.name,
      required this.v});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      image: (json['image'] as List)
        .map((posterImageJson) => PosterImage.fromJson(posterImageJson))
        .toList(),
      enabled: json['enabled'],
      id: json['_id'],
      name: json['name'],
      v: json['__v'],
    );
  }
}

class BannerSlider {
  final List<ImageInfo> image;
  final bool enabled;
  final String id;
  final String name;
  final int v;

  BannerSlider({
    required this.image,
    required this.enabled,
    required this.id,
    required this.name,
    required this.v,
  });

  factory BannerSlider.fromJson(Map<String, dynamic> json) {
    return BannerSlider(
      image: List<ImageInfo>.from(json['image'].map((x) => ImageInfo.fromJson(x))),
      enabled: json['enabled'],
      id: json['_id'],
      name: json['name'],
      v: json['__v'],
    );
  }
}

class ImageInfo {
  final String uid;
  final int lastModified;
  final String lastModifiedDate;
  final String name;
  final int size;
  final String type;
  final int percent;
  final OriginFileObj originFileObj;
  final String status;
  final String response;

  ImageInfo({
    required this.uid,
    required this.lastModified,
    required this.lastModifiedDate,
    required this.name,
    required this.size,
    required this.type,
    required this.percent,
    required this.originFileObj,
    required this.status,
    required this.response,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      uid: json['uid'],
      lastModified: json['lastModified'],
      lastModifiedDate: json['lastModifiedDate'],
      name: json['name'],
      size: json['size'],
      type: json['type'],
      percent: json['percent'],
      originFileObj: OriginFileObj.fromJson(json['originFileObj']),
      status: json['status'],
      response: json['response'],
    );
  }
}

class OriginFileObj {
  final String uid;

  OriginFileObj({
    required this.uid,
  });

  factory OriginFileObj.fromJson(Map<String, dynamic> json) {
    return OriginFileObj(
      uid: json['uid'],
    );
  }
}

class Bhajan {
  List<Audio> audio;
  List<Poster>? poster;
  String id;
  String title;
  String description;
  int v;

  Bhajan(
      {required this.audio,
      this.poster,
      required this.id,
      required this.title,
      required this.description,
      required this.v});

  factory Bhajan.fromJson(Map<String, dynamic> json) {
    return Bhajan(
        audio: (json['audio'] as List)
            .map((audioJson) => Audio.fromJson(audioJson))
            .toList(),
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        v: json['__v'],
        poster: (json['poster'] as List)
            .map((audioJson) => Poster.fromJson(audioJson))
            .toList());
  }
}

class Audio {
  String uid;
  int lastModified;
  DateTime lastModifiedDate;
  String name;
  int size;
  String type;
  int percent;
  dynamic originFileObj;
  String status;
  dynamic response;

  Audio(
      {required this.uid,
      required this.lastModified,
      required this.lastModifiedDate,
      required this.name,
      required this.size,
      required this.type,
      required this.percent,
      this.originFileObj,
      required this.status,
      this.response});

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      uid: json['uid'],
      lastModified: json['lastModified'],
      lastModifiedDate: DateTime.parse(json['lastModifiedDate']),
      name: json['name'],
      size: json['size'],
      type: json['type'],
      percent: json['percent'],
      originFileObj: json['originFileObj'],
      status: json['status'],
      response: json['response'],
    );
  }
}

class Poster {
  String uid;
  int lastModified;
  DateTime lastModifiedDate;
  String name;
  int size;
  String type;
  int percent;
  dynamic originFileObj;
  String status;
  dynamic response;

  Poster(
      {required this.uid,
      required this.lastModified,
      required this.lastModifiedDate,
      required this.name,
      required this.size,
      required this.type,
      required this.percent,
      this.originFileObj,
      required this.status,
      this.response});

  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(
      uid: json['uid'],
      lastModified: json['lastModified'],
      lastModifiedDate: DateTime.parse(json['lastModifiedDate']),
      name: json['name'],
      size: json['size'],
      type: json['type'],
      percent: json['percent'],
      originFileObj: json['originFileObj'],
      status: json['status'],
      response: json['response'],
    );
  }
}

class Ebook {
  List<PosterImage> posterImage;
  List<Pdf> pdf;
  String id;
  String title;
  String description;
  int v;

  Ebook(
      {required this.posterImage,
      required this.pdf,
      required this.id,
      required this.title,
      required this.description,
      required this.v});

  factory Ebook.fromJson(Map<String, dynamic> json) {
    return Ebook(
      posterImage: (json['posterImage'] as List)
          .map((posterImageJson) => PosterImage.fromJson(posterImageJson))
          .toList(),
      pdf: (json['pdf'] as List)
          .map((pdfJson) => Pdf.fromJson(pdfJson))
          .toList(),
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      v: json['__v'],
    );
  }
}

class PosterImage {
  String uid;
  int lastModified;
  DateTime lastModifiedDate;
  String name;
  int size;
  String type;
  int percent;
  dynamic originFileObj;
  String status;
  dynamic response;

  PosterImage(
      {required this.uid,
      required this.lastModified,
      required this.lastModifiedDate,
      required this.name,
      required this.size,
      required this.type,
      required this.percent,
      this.originFileObj,
      required this.status,
      this.response});

  factory PosterImage.fromJson(Map<String, dynamic> json) {
    return PosterImage(
      uid: json['uid'],
      lastModified: json['lastModified'],
      lastModifiedDate: DateTime.parse(json['lastModifiedDate']),
      name: json['name'],
      size: json['size'],
      type: json['type'],
      percent: json['percent'],
      originFileObj: json['originFileObj'],
      status: json['status'],
      response: json['response'],
    );
  }
}

class Pdf {
  String uid;
  int lastModified;
  DateTime lastModifiedDate;
  String name;
  int size;
  String type;
  int percent;
  dynamic originFileObj;
  String status;
  dynamic response;

  Pdf(
      {required this.uid,
      required this.lastModified,
      required this.lastModifiedDate,
      required this.name,
      required this.size,
      required this.type,
      required this.percent,
      this.originFileObj,
      required this.status,
      this.response});

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      uid: json['uid'],
      lastModified: json['lastModified'],
      lastModifiedDate: DateTime.parse(json['lastModifiedDate']),
      name: json['name'],
      size: json['size'],
      type: json['type'],
      percent: json['percent'],
      originFileObj: json['originFileObj'],
      status: json['status'],
      response: json['response'],
    );
  }
}

class VideoContent {
  String id;
  bool enabled;
  String title;
  String youtubeUrl;
  String contentType;
  String category;
  int v;
  List<CategoryDetail> categoryDetails;

  VideoContent(
      {required this.id,
      required this.enabled,
      required this.title,
      required this.youtubeUrl,
      required this.contentType,
      required this.category,
      required this.v,
      required this.categoryDetails});

  factory VideoContent.fromJson(Map<String, dynamic> json) {
    return VideoContent(
      id: json['_id'],
      enabled: json['enabled'],
      title: json['title'],
      youtubeUrl: json['youtubeUrl'],
      contentType: json['contentType'],
      category: json['category'],
      v: json['__v'],
      categoryDetails: (json['categoryDetails'] as List)
          .map((categoryDetailJson) =>
              CategoryDetail.fromJson(categoryDetailJson))
          .toList(),
    );
  }
}

class CategoryDetail {
  String id;
  dynamic image;
  bool enabled;
  String name;
  int v;

  CategoryDetail(
      {required this.id,
      required this.image,
      required this.enabled,
      required this.name,
      required this.v});

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      id: json['_id'],
      image: json['image'],
      enabled: json['enabled'],
      name: json['name'],
      v: json['__v'],
    );
  }
}

class UpComingSatsang {
  String id;
  String title;
  String date;
  String place;
  String contactInformation;

  UpComingSatsang({
    required this.id,
    required this.title,
    required this.date,
    required this.place,
    required this.contactInformation,
  });

  factory UpComingSatsang.fromJson(Map<String, dynamic> json) {
    return UpComingSatsang(
      id: json['_id'],
      title: json['title'],
      date: json['date'],
      place: json['place'],
      contactInformation: json['contactInformation'],
    );
  }
}