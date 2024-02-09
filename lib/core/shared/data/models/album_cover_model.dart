import 'package:musiclum/core/shared/domain/entities/album_cover_entity.dart';

class AlbumCoverModel extends AlbumCoverEntity {
  const AlbumCoverModel({
    required super.url,
    required super.height,
    required super.width,
  });

  factory AlbumCoverModel.fromJson(Map<String, dynamic> json) => AlbumCoverModel(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
}
