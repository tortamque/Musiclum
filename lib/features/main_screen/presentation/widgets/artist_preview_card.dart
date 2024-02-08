import 'package:flutter/material.dart';

class ArtistPreviewCard extends StatelessWidget {
  const ArtistPreviewCard({super.key, required this.artistName, required this.photoUrl});

  final String photoUrl;
  final String artistName;

  @override
  Widget build(BuildContext context) => Card(
    child: Row(
      children: [
        ClipOval(
          child: Image.network(
            photoUrl,
            width: 100, 
            height: 100,
            fit: BoxFit.cover, 
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
        Text(artistName),
      ],
    )
  );
}
