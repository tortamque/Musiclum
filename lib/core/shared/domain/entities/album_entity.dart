import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  final String albumType;
  final int totalTracks;
  final List<String> availableMarkets;
  final ExternalUrlsEntity externalUrls;
  final String href;
  final String id;
  final List<ImageEntity> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final RestrictionsEntity? restrictions;
  final String type;
  final String uri;
  final List<ArtistEntity> artists;
  final String albumGroup;

  const AlbumEntity({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    this.restrictions,
    required this.type,
    required this.uri,
    required this.artists,
    required this.albumGroup,
  });

  @override
  List<Object?> get props => [id];
}

class ExternalUrlsEntity extends Equatable {
  final String spotify;

  const ExternalUrlsEntity({required this.spotify});

  @override
  List<Object?> get props => [spotify];
}

class ImageEntity extends Equatable {
  final String url;
  final int height;
  final int width;

  const ImageEntity({required this.url, required this.height, required this.width});

  @override
  List<Object?> get props => [url, height, width];
}

class RestrictionsEntity extends Equatable {
  final String reason;

  const RestrictionsEntity({required this.reason});

  @override
  List<Object?> get props => [reason];
}

class ArtistEntity extends Equatable {
  final ExternalUrlsEntity externalUrls;
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  const ArtistEntity({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  @override
  List<Object?> get props => [id];
}
