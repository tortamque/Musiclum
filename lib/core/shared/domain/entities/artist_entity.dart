import 'package:equatable/equatable.dart';

class ArtistEntity extends Equatable{
  const ArtistEntity({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  final ExternalUrlsEntity? externalUrls;
  final FollowersEntity? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<ImageEntity>? images;
  final String? name;
  final int? popularity;
  final String? type;
  final String? uri;

  @override
  List<Object?> get props => [
    externalUrls,
    followers,
    genres,
    href,
    id,
    images,
    name,
    popularity,
    type,
    uri,
  ];
}

class ExternalUrlsEntity extends Equatable{
  const ExternalUrlsEntity({this.spotify});

  final String? spotify;
      
  @override
  List<Object?> get props => [spotify];
}

class FollowersEntity extends Equatable {
  const FollowersEntity({this.href, this.total});

  final String? href;
  final int? total;
      
  @override
  List<Object?> get props => [href, total];
}

class ImageEntity extends Equatable{
  const ImageEntity({
    this.url,
    this.height,
    this.width,
  });

  final String? url;
  final int? height;
  final int? width;
      
  @override
  List<Object?> get props => [url, height, width];
}
