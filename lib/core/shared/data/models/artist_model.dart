import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity{
  const ArtistModel({
    required super.externalUrls, 
    required super.followers, 
    required super.genres, 
    required super.href, 
    required super.id, 
    required super.images, 
    required super.name, 
    required super.popularity, 
    required super.type, 
    required super.uri,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
      externalUrls: ExternalUrlsModel.fromJson(json['external_urls']),
      followers: FollowersModel.fromJson(json['followers']),
      genres: List<String>.from(json['genres']),
      href: json['href'],
      id: json['id'],
      images: List<ImageModel>.from(json['images'].map((imageJson) => ImageModel.fromJson(imageJson))),
      name: json['name'],
      popularity: json['popularity'],
      type: json['type'],
      uri: json['uri'],
    );
}

class ExternalUrlsModel extends ExternalUrlsEntity {
  const ExternalUrlsModel({required String spotify}) : super(spotify: spotify);

  factory ExternalUrlsModel.fromJson(Map<String, dynamic> json) => ExternalUrlsModel(
      spotify: json['spotify'],
    );
}

class FollowersModel extends FollowersEntity {
  const FollowersModel({String? href, required int total}) : super(href: href, total: total);

  factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
      href: json['href'],
      total: json['total'],
    );
}

class ImageModel extends ImageEntity {
  const ImageModel({
    required String url,
    required int height,
    required int width,
  }) : super(url: url, height: height, width: width);

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
}

