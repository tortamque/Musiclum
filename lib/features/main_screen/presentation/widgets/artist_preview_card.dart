import 'package:flutter/material.dart';

class ArtistPreviewCard extends StatelessWidget {
  const ArtistPreviewCard({super.key, required this.artistName, required this.photoUrl, required this.imageSize});

  final String photoUrl;
  final String artistName;
  final double imageSize;

  @override
  Widget build(BuildContext context) => Card(
    child: Row(
      children: [
        _NetworkImage(photoUrl: photoUrl, imageSize: imageSize),
        _ArtistName(artistName: artistName),
      ],
    ),
  );
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({required this.photoUrl, required this.imageSize});

  final String photoUrl;
  final double imageSize;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(15),
    child: ClipOval(
      child: Image.network(
        photoUrl,
        width: imageSize, 
        height: imageSize,
        fit: BoxFit.cover, 
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: SizedBox(
              width: imageSize,
              height: imageSize,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      ),
    ),
  );
}

class _ArtistName extends StatelessWidget {
  const _ArtistName({required this.artistName});

  final String artistName;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Text(
      artistName,
      style: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}