import 'package:musiclum/core/shared/data/models/artist_model.dart';
import 'package:musiclum/core/shared/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  const AlbumModel({
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

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
      albumType: json['album_type'],
      totalTracks: json['total_tracks'],
      availableMarkets: List<String>.from(json['available_markets']),
      externalUrls: ExternalUrlsModel(spotify: json['external_urls']['spotify']) as ExternalUrlsEntity,
      href: json['href'],
      id: json['id'],
      images: (json['images'] as List).map((i) => ImageModel.fromJson(i) as ImageEntity).toList(),
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      restrictions: json['restrictions'] != null ? RestrictionsModel.fromJson(json['restrictions']) : null,
      type: json['type'],
      uri: json['uri'],
      artists: (json['artists'] as List).map((a) => ArtistModel.fromJson(a) as ArtistEntity).toList(),
      albumGroup: json['album_group'],
    );
}

class RestrictionsModel extends RestrictionsEntity {
  const RestrictionsModel({required super.reason});

  factory RestrictionsModel.fromJson(Map<String, dynamic> json) => RestrictionsModel(
      reason: json['reason'],
    );
}
