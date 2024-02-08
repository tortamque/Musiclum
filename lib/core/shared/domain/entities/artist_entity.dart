import 'package:equatable/equatable.dart';

class ArtistEntity extends Equatable{
  const ArtistEntity({
    required this.externalUrls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });

  final ExternalUrlsEntity externalUrls;
  final FollowersEntity followers;
  final List<String> genres;
  final String href;
  final String id;
  final List<ImageEntity> images;
  final String name;
  final int popularity;
  final String type;
  final String uri;

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
  const ExternalUrlsEntity({required this.spotify});

  final String spotify;
      
  @override
  List<Object?> get props => [spotify];
}

class FollowersEntity extends Equatable {
  final String? href;
  final int total;

  const FollowersEntity({this.href, required this.total});
      
  @override
  List<Object?> get props => [href, total];
}

class ImageEntity extends Equatable{
  final String url;
  final int height;
  final int width;

  const ImageEntity({
    required this.url,
    required this.height,
    required this.width,
  });
      
  @override
  List<Object?> get props => [url, height, width];
}
