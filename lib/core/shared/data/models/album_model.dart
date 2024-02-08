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
    required super.restrictions,
    required super.type,
    required super.uri,
    required super.artists,
    required super.tracks,
    required super.copyrights,
    required super.externalIds,
    required super.genres,
    required super.label,
    required super.popularity,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    albumType: json['album_type'],
    totalTracks: json['total_tracks'],
    availableMarkets: List<String>.from(json['available_markets']),
    externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls']),
    href: json['href'],
    id: json['id'],
    images: List<AlbumImageModel>.from(json['images'].map((x) => AlbumImageModel.fromJson(x))),
    name: json['name'],
    releaseDate: json['release_date'],
    releaseDatePrecision: json['release_date_precision'],
    restrictions: AlbumRestrictionsModel.fromJson(json['restrictions']),
    type: json['type'],
    uri: json['uri'],
    artists: List<AlbumArtistModel>.from(json['artists'].map((x) => AlbumArtistModel.fromJson(x))),
    tracks: AlbumTracksModel.fromJson(json['tracks']),
    copyrights: List<AlbumCopyrightModel>.from(json['copyrights'].map((x) => AlbumCopyrightModel.fromJson(x))),
    externalIds: AlbumExternalIdsModel.fromJson(json['external_ids']),
    genres: List<String>.from(json['genres']),
    label: json['label'],
    popularity: json['popularity'],
  );
}

class AlbumRestrictionsModel extends AlbumRestrictionsEntity {
  const AlbumRestrictionsModel({required super.reason});

  factory AlbumRestrictionsModel.fromJson(Map<String, dynamic> json) => AlbumRestrictionsModel(
    reason: json['reason'],
  );
}

class AlbumExternalIdsModel extends AlbumExternalIdsEntity {
  const AlbumExternalIdsModel({
    required super.isrc,
    required super.ean,
    required super.upc,
  });

  factory AlbumExternalIdsModel.fromJson(Map<String, dynamic> json) => AlbumExternalIdsModel(
    isrc: json['isrc'],
    ean: json['ean'],
    upc: json['upc'],
  );
}

class AlbumImageModel extends AlbumImageEntity {
  const AlbumImageModel({
    required super.url,
    required super.height,
    required super.width,
  });

  factory AlbumImageModel.fromJson(Map<String, dynamic> json) => AlbumImageModel(
    url: json['url'],
    height: json['height'],
    width: json['width'],
  );
}

class AlbumArtistModel extends AlbumArtistEntity {
  const AlbumArtistModel({
    required super.externalUrls,
    required super.href,
    required super.id,
    required super.name,
    required super.type,
    required super.uri,
  });

  factory AlbumArtistModel.fromJson(Map<String, dynamic> json) => AlbumArtistModel(
    externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls']),
    href: json['href'],
    id: json['id'],
    name: json['name'],
    type: json['type'],
    uri: json['uri'],
  );
}

class AlbumTracksModel extends AlbumTracksEntity {
  const AlbumTracksModel({
    required super.href,
    required super.limit,
    required super.next,
    required super.offset,
    required super.previous,
    required super.total,
    required super.items,
  });

  factory AlbumTracksModel.fromJson(Map<String, dynamic> json) => AlbumTracksModel(
    href: json['href'],
    limit: json['limit'],
    next: json['next'],
    offset: json['offset'],
    previous: json['previous'],
    total: json['total'],
    items: List<AlbumTrackItemModel>.from(json['items'].map((x) => AlbumTrackItemModel.fromJson(x))),
  );
}

class AlbumTrackItemModel extends AlbumTrackItemEntity {
  const AlbumTrackItemModel({
    required super.artists,
    required super.availableMarkets,
    required super.discNumber,
    required super.durationMs,
    required super.explicit,
    required super.externalUrls,
    required super.href,
    required super.id,
    required super.isPlayable,
    required super.linkedFrom,
    required super.restrictions,
    required super.name,
    required super.previewUrl,
    required super.trackNumber,
    required super.type,
    required super.uri,
    required super.isLocal,
  });

  factory AlbumTrackItemModel.fromJson(Map<String, dynamic> json) => AlbumTrackItemModel(
    artists: List<AlbumArtistModel>.from(json['artists'].map((x) => AlbumArtistModel.fromJson(x))),
    availableMarkets: List<String>.from(json['available_markets']),
    discNumber: json['disc_number'],
    durationMs: json['duration_ms'],
    explicit: json['explicit'],
    externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls']),
    href: json['href'],
    id: json['id'],
    isPlayable: json['is_playable'],
    linkedFrom: AlbumLinkedFromModel.fromJson(json['linked_from'] ?? {}),
    restrictions: AlbumRestrictionsModel.fromJson(json['restrictions'] ?? {}),
    name: json['name'],
    previewUrl: json['preview_url'],
    trackNumber: json['track_number'],
    type: json['type'],
    uri: json['uri'],
    isLocal: json['is_local'],
  );
}

class AlbumCopyrightModel extends AlbumCopyrightEntity {
  const AlbumCopyrightModel({
    required super.text,
    required super.type,
  });

  factory AlbumCopyrightModel.fromJson(Map<String, dynamic> json) => AlbumCopyrightModel(
    text: json['text'],
    type: json['type'],
  );
}

class AlbumExternalUrlsModel extends AlbumExternalUrlsEntity {
  const AlbumExternalUrlsModel({required super.spotify});

  factory AlbumExternalUrlsModel.fromJson(Map<String, dynamic> json) => AlbumExternalUrlsModel(
      spotify: json['spotify'],
    );
}

class AlbumLinkedFromModel extends AlbumLinkedFromEntity {
  const AlbumLinkedFromModel({
    required super.href,
    required super.id,
    required super.type,
    required super.uri,
  });

  factory AlbumLinkedFromModel.fromJson(Map<String, dynamic> json) => AlbumLinkedFromModel(
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
    );
}
