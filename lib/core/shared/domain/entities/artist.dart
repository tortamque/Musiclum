import 'package:equatable/equatable.dart';

class Artist extends Equatable{
  final ExternalUrls externalUrls;
  final Followers followers;
  final List<String> genres;
  final String href;
  final String id;
  final List<Image> images;
  final String name;
  final int popularity;
  final String type;
  final String uri;

  const Artist({
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

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json['external_urls']),
        followers: Followers.fromJson(json['followers']),
        genres: List<String>.from(json['genres']),
        href: json['href'],
        id: json['id'],
        images: List<Image>.from(json['images'].map((x) => Image.fromJson(x))),
        name: json['name'],
        popularity: json['popularity'],
        type: json['type'],
        uri: json['uri'],
      );
      
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

class ExternalUrls extends Equatable{
  final String spotify;

  const ExternalUrls({required this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json['spotify'],
      );
      
  @override
  List<Object?> get props => [spotify];
}

class Followers extends Equatable {
  final String? href;
  final int total;

  const Followers({this.href, required this.total});

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json['href'],
        total: json['total'],
      );
      
  @override
  List<Object?> get props => [href, total];
}

class Image extends Equatable{
  final String url;
  final int height;
  final int width;

  const Image({
    required this.url,
    required this.height,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json['url'],
        height: json['height'],
        width: json['width'],
      );
      
  @override
  List<Object?> get props => [url, height, width];
}
