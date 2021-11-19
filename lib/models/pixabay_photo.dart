class PixabayStat {
  late final int? views;
  late final int? downloads;
  late final int? favorites;
  late final int? likes;
  late final int? comments;

  PixabayStat({
    required this.views,
    required this.downloads,
    required this.favorites,
    required this.likes,
    required this.comments,
  });

  PixabayStat.fromJson(json) {
    views = json['views'];
    downloads = json['downloads'];
    favorites = json['favorites'];
    likes = json['likes'];
    comments = json['comments'];
  }
}

class PixabayPhoto {
  late final int? id;
  late final String? user;
  late final PixabayStat stat;
  late final int? webformatHeight;
  late final int? webformatWidth;
  late final String? webformatURL;
  late final String? userImageURL;

  PixabayPhoto({
    required this.id,
    required this.user,
    required this.stat,
    required this.webformatHeight,
    required this.webformatWidth,
    required this.webformatURL,
    required this.userImageURL,
  });

  PixabayPhoto.fromJson(json) {
    id = json['id'];
    user = json['user'];
    stat = PixabayStat.fromJson(json);
    webformatHeight = json['webformatHeight'];
    webformatWidth = json['webformatWidth'];
    webformatURL = json['webformatURL'];
    userImageURL = json['userImageURL'];
  }
}
