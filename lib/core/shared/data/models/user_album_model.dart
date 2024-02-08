import 'package:musiclum/core/shared/domain/entities/user_album_entity.dart';

class UserAlbumModel extends UserAlbumEntity {
  const UserAlbumModel({
    required super.albumType,
    required super.totalTracks,
    required super.availableMarkets,
    required super.externalUrls,
    required super.href,
    required super.id,
    required super.images,
    required super.name,
    required super.releaseDate,
    required super.releaseDatePrecision,
    super.restrictions,
    required super.type,
    required super.uri,
    required super.artists,
    required super.albumGroup,
  });

  factory UserAlbumModel.fromJson(Map<String, dynamic> json) => UserAlbumModel(
      albumType: json['album_type'] as String,
      totalTracks: json['total_tracks'] as int,
      availableMarkets: List<String>.from(json['available_markets']),
      externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List).map((e) => AlbumImageModel.fromJson(e as Map<String, dynamic>)).toList(),
      name: json['name'] as String,
      releaseDate: json['release_date'] as String,
      releaseDatePrecision: json['release_date_precision'] as String,
      restrictions: json['restrictions'] != null ? AlbumRestrictionsModel.fromJson(json['restrictions'] as Map<String, dynamic>) : null,
      type: json['type'] as String,
      uri: json['uri'] as String,
      artists: (json['artists'] as List).map((e) => AlbumArtistModel.fromJson(e as Map<String, dynamic>)).toList(),
      albumGroup: json['album_group'] as String,
    );
}

class AlbumArtistModel extends AlbumArtistEntity{
  const AlbumArtistModel({required super.externalUrls, required super.href, required super.id, required super.name, required super.type, required super.uri});

  factory AlbumArtistModel.fromJson(Map<String, dynamic> json) => AlbumArtistModel(
      externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls']),
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
}

class AlbumExternalUrlsModel extends AlbumExternalUrlsEntity {
  const AlbumExternalUrlsModel({required super.spotify});

  factory AlbumExternalUrlsModel.fromJson(Map<String, dynamic> json) => AlbumExternalUrlsModel(
      spotify: json['spotify'] as String,
    );
}

class AlbumImageModel extends AlbumImageEntity {
  const AlbumImageModel({required super.url, required super.height, required super.width});

  factory AlbumImageModel.fromJson(Map<String, dynamic> json) => AlbumImageModel(
      url: json['url'] as String,
      height: json['height'] as int,
      width: json['width'] as int,
    );
}

class AlbumRestrictionsModel extends AlbumRestrictionsEntity {
  const AlbumRestrictionsModel({required String reason}) : super(reason: reason);

  factory AlbumRestrictionsModel.fromJson(Map<String, dynamic> json) => AlbumRestrictionsModel(
      reason: json['reason'] as String,
    );
}
