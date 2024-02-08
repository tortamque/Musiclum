import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
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
  final AlbumTracksEntity tracks;
  final List<AlbumCopyrightEntity> copyrights;
  final AlbumExternalIdsEntity externalIds;
  final List<String> genres;
  final String label;
  final int popularity;

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
    required this.tracks,
    required this.copyrights,
    required this.externalIds,
    required this.genres,
    required this.label,
    required this.popularity,
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
    tracks,
    copyrights,
    externalIds,
    genres,
    label,
    popularity,
  ];
}

class AlbumRestrictionsEntity extends Equatable {
  final String? reason;

  const AlbumRestrictionsEntity({this.reason});

  @override
  List<Object?> get props => [reason];
}

class AlbumExternalIdsEntity extends Equatable {
  final String? isrc;
  final String? ean;
  final String? upc;

  const AlbumExternalIdsEntity({
    this.isrc,
    this.ean,
    this.upc,
  });

  @override
  List<Object?> get props => [isrc, ean, upc];
}

class AlbumCopyrightEntity extends Equatable {
  final String text;
  final String type;

  const AlbumCopyrightEntity({
    required this.text,
    required this.type,
  });

  @override
  List<Object?> get props => [text, type];
}

class AlbumImageEntity extends Equatable {
  final String url;
  final int height;
  final int width;

  const AlbumImageEntity({
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  List<Object?> get props => [url, height, width];
}

class AlbumArtistEntity extends Equatable {
  final AlbumExternalUrlsEntity externalUrls;
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  const AlbumArtistEntity({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  @override
  List<Object?> get props => [
    externalUrls,
    href,
    id,
    name,
    type,
    uri,
  ];
}

class AlbumTracksEntity extends Equatable {
  final String href;
  final int limit;
  final String? next;
  final int offset;
  final String? previous;
  final int total;
  final List<AlbumTrackItemEntity> items;

  const AlbumTracksEntity({
    required this.href,
    required this.limit,
    this.next,
    required this.offset,
    this.previous,
    required this.total,
    required this.items,
  });

  @override
  List<Object?> get props => [
    href,
    limit,
    next,
    offset,
    previous,
    total,
    items,
  ];
}

class AlbumTrackItemEntity extends Equatable {
  final List<AlbumArtistEntity> artists;
  final List<String> availableMarkets;
  final int discNumber;
  final int durationMs;
  final bool explicit;
  final AlbumExternalUrlsEntity externalUrls;
  final String href;
  final String id;
  final bool? isPlayable;
  final AlbumLinkedFromEntity? linkedFrom;
  final AlbumRestrictionsEntity? restrictions;
  final String name;
  final String previewUrl;
  final int trackNumber;
  final String type;
  final String uri;
  final bool isLocal;

  const AlbumTrackItemEntity({
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    this.isPlayable,
    this.linkedFrom,
    this.restrictions,
    required this.name,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
    required this.isLocal,
  });

  @override
  List<Object?> get props => [
    artists,
    availableMarkets,
    discNumber,
    durationMs,
    explicit,
    externalUrls,
    href,
    id,
    isPlayable,
    linkedFrom,
    restrictions,
    name,
    previewUrl,
    trackNumber,
    type,
    uri,
    isLocal,
  ];
}

class AlbumExternalUrlsEntity extends Equatable {
  final String spotify;

  const AlbumExternalUrlsEntity({required this.spotify});

  @override
  List<Object?> get props => [spotify];
}

class AlbumLinkedFromEntity extends Equatable {
  final String? href;
  final String? id;
  final String? type;
  final String? uri;

  const AlbumLinkedFromEntity({
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  @override
  List<Object?> get props => [href, id, type, uri];
}
