import 'package:musiclum/core/shared/domain/entities/artist_entity.dart';

class ArtistModel extends ArtistEntity{
  const ArtistModel({
    required super.externalUrls, 
    required super.followers, 
    required super.genres, 
    required super.href, 
    required super.id, 
    required super.images, 
    required super.name, 
    required super.popularity, 
    required super.type, 
    required super.uri,
  });
}
