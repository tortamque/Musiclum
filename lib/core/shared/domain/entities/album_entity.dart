import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  const AlbumEntity({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  final String? href;
  final List<AlbumTrackEntity>? items;
  final int? limit;
  final String? next;
  final int? offset;
  final String? previous;
  final int? total;

  @override
  List<Object?> get props => [href, items, limit, next, offset, previous, total];
}

class AlbumTrackEntity extends Equatable {
  const AlbumTrackEntity({
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.isPlayable,
    this.linkedFrom,
    this.restrictions,
    this.name,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
    this.isLocal,
  });

  final List<AlbumArtistEntity>? artists;
  final List<String>? availableMarkets;
  final int? discNumber;
  final int? durationMs;
  final bool? explicit;
  final AlbumExternalUrlsEntity? externalUrls;
  final String? href;
  final String? id;
  final bool? isPlayable;
  final AlbumLinkedFromEntity? linkedFrom;
  final AlbumRestrictionsEntity? restrictions;
  final String? name;
  final String? previewUrl;
  final int? trackNumber;
  final String? type;
  final String? uri;
  final bool? isLocal;

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

class AlbumArtistEntity extends Equatable {
  const AlbumArtistEntity({
    this.id,
    this.name,
    this.href,
    this.type,
    this.uri,
    this.externalUrls,
  });

  final String? id;
  final String? name;
  final String? href;
  final String? type;
  final String? uri;
  final AlbumExternalUrlsEntity? externalUrls;

  @override
  List<Object?> get props => [id, name, href, type, uri, externalUrls];
}

class AlbumExternalUrlsEntity extends Equatable {
  const AlbumExternalUrlsEntity({this.spotify});

  final String? spotify;

  @override
  List<Object?> get props => [spotify];
}

class AlbumLinkedFromEntity extends Equatable {
  const AlbumLinkedFromEntity({
    this.id,
    this.uri,
    this.href,
    this.type,
  });

  final String? id;
  final String? uri;
  final String? href;
  final String? type;

  @override
  List<Object?> get props => [id, uri, href, type];
}

class AlbumRestrictionsEntity extends Equatable {
  const AlbumRestrictionsEntity({this.reason});

  final String? reason;

  @override
  List<Object?> get props => [reason];
}
