import 'package:equatable/equatable.dart';

class UserAlbumEntity extends Equatable {
  final String albumType;
  final int totalTracks;
  final List<String> availableMarkets;
  final AlbumExternalUrlsEntity externalUrls;
  final String href;
  final String id;
  final List<AlbumImageEntity> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final AlbumRestrictionsEntity? restrictions;
  final String type;
  final String uri;
  final List<AlbumArtistEntity> artists;
  final String albumGroup;

  const UserAlbumEntity({
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
  List<Object?> get props => [
        albumType,
        totalTracks,
        availableMarkets,
        externalUrls,
        href,
        id,
        images,
        name,
        releaseDate,
        releaseDatePrecision,
        restrictions,
        type,
        uri,
        artists,
        albumGroup,
      ];
}

class AlbumExternalUrlsEntity extends Equatable {
  final String spotify;

  const AlbumExternalUrlsEntity({required this.spotify});

  @override
  List<Object?> get props => [spotify];
}

class AlbumImageEntity extends Equatable {
  final String url;
  final int height;
  final int width;

  const AlbumImageEntity({required this.url, required this.height, required this.width});

  @override
  List<Object?> get props => [url, height, width];
}

class AlbumRestrictionsEntity extends Equatable {
  final String reason;

  const AlbumRestrictionsEntity({required this.reason});

  @override
  List<Object?> get props => [reason];
}

class AlbumArtistEntity extends Equatable {
  const AlbumArtistEntity({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  final AlbumExternalUrlsEntity externalUrls;
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  @override
  List<Object?> get props => [externalUrls, href, id, name, type, uri];
}
