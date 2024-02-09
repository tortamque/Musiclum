import 'package:equatable/equatable.dart';

class UserAlbumEntity extends Equatable {
  const UserAlbumEntity({
    this.albumType,
    this.totalTracks,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.restrictions,
    this.type,
    this.uri,
    this.artists,
    this.albumGroup,
  });
  
  final String? albumType;
  final int? totalTracks;
  final List<String>? availableMarkets;
  final AlbumExternalUrlsEntity? externalUrls;
  final String? href;
  final String? id;
  final List<AlbumImageEntity>? images;
  final String? name;
  final String? releaseDate;
  final String? releaseDatePrecision;
  final AlbumRestrictionsEntity? restrictions;
  final String? type;
  final String? uri;
  final List<AlbumArtistEntity>? artists;
  final String? albumGroup;

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
  const AlbumExternalUrlsEntity({this.spotify});

  final String? spotify;

  @override
  List<Object?> get props => [spotify];
}

class AlbumImageEntity extends Equatable {
  const AlbumImageEntity({this.url, this.height, this.width});

  final String? url;
  final int? height;
  final int? width;

  @override
  List<Object?> get props => [url, height, width];
}

class AlbumRestrictionsEntity extends Equatable {
  const AlbumRestrictionsEntity({this.reason});

  final String? reason;

  @override
  List<Object?> get props => [reason];
}

class AlbumArtistEntity extends Equatable {
  const AlbumArtistEntity({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  final AlbumExternalUrlsEntity? externalUrls;
  final String? href;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  @override
  List<Object?> get props => [externalUrls, href, id, name, type, uri];
}
