import 'package:musiclum/core/shared/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  const AlbumModel({
    super.href,
    super.items,
    super.limit,
    super.next,
    super.offset,
    super.previous,
    super.total,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    href: json['href'],
    items: List<AlbumTrackModel>.from(json['items'].map((x) => AlbumTrackModel.fromJson(x))),
    limit: json['limit'],
    next: json['next'],
    offset: json['offset'],
    previous: json['previous'],
    total: json['total'],
  );
}

class AlbumTrackModel extends AlbumTrackEntity {
  const AlbumTrackModel({
    super.artists,
    super.availableMarkets,
    super.discNumber,
    super.durationMs,
    super.explicit,
    super.externalUrls,
    super.href,
    super.id,
    super.isPlayable,
    super.linkedFrom,
    super.restrictions,
    super.name,
    super.previewUrl,
    super.trackNumber,
    super.type,
    super.uri,
    super.isLocal,
  });

  factory AlbumTrackModel.fromJson(Map<String, dynamic> json) => AlbumTrackModel(
    artists: List<AlbumArtistModel>.from(json['artists'].map((x) => AlbumArtistModel.fromJson(x))),
    availableMarkets: List<String>.from(json['available_markets']),
    discNumber: json['disc_number'],
    durationMs: json['duration_ms'],
    explicit: json['explicit'],
    externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls']),
    href: json['href'],
    id: json['id'],
    isPlayable: json['is_playable'],
    linkedFrom: json['linked_from'] != null ? AlbumLinkedFromModel.fromJson(json['linked_from']) : null,
    restrictions: json['restrictions'] != null ? AlbumRestrictionsModel.fromJson(json['restrictions']) : null,
    name: json['name'],
    previewUrl: json['preview_url'],
    trackNumber: json['track_number'],
    type: json['type'],
    uri: json['uri'],
    isLocal: json['is_local'],
  );
}

class AlbumArtistModel extends AlbumArtistEntity {
  const AlbumArtistModel({
    super.id,
    super.name,
    super.href,
    super.type,
    super.uri,
    super.externalUrls,
  });

  factory AlbumArtistModel.fromJson(Map<String, dynamic> json) => AlbumArtistModel(
    id: json['id'],
    name: json['name'],
    href: json['href'],
    type: json['type'],
    uri: json['uri'],
    externalUrls: AlbumExternalUrlsModel.fromJson(json['external_urls']),
  );
}

class AlbumExternalUrlsModel extends AlbumExternalUrlsEntity {
  const AlbumExternalUrlsModel({super.spotify});

  factory AlbumExternalUrlsModel.fromJson(Map<String, dynamic> json) => AlbumExternalUrlsModel(
      spotify: json['spotify'],
    );
}

class AlbumLinkedFromModel extends AlbumLinkedFromEntity {
  const AlbumLinkedFromModel({
    super.id,
    super.uri,
    super.href,
    super.type,
  });

  factory AlbumLinkedFromModel.fromJson(Map<String, dynamic> json) => AlbumLinkedFromModel(
      id: json['id'],
      uri: json['uri'],
      href: json['href'],
      type: json['type'],
    );
}

class AlbumRestrictionsModel extends AlbumRestrictionsEntity {
  const AlbumRestrictionsModel({super.reason});

  factory AlbumRestrictionsModel.fromJson(Map<String, dynamic> json) => AlbumRestrictionsModel(
      reason: json['reason'],
    );
}
