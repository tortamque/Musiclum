import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity{
  const ArtistModel({
    super.externalUrls, 
    super.followers, 
    super.genres, 
    super.href, 
    super.id, 
    super.images, 
    super.name, 
    super.popularity, 
    super.type, 
    super.uri,
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
  const ExternalUrlsModel({super.spotify});

  factory ExternalUrlsModel.fromJson(Map<String, dynamic> json) => ExternalUrlsModel(
      spotify: json['spotify'],
    );
}

class FollowersModel extends FollowersEntity {
  const FollowersModel({super.href, super.total});

  factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
      href: json['href'],
      total: json['total'],
    );
}

class ImageModel extends ImageEntity {
  const ImageModel({
    super.url,
    super.height,
    super.width,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
}
