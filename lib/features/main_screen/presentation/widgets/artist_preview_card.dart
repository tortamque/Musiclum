import 'package:flutter/material.dart';

class ArtistPreviewCard extends StatelessWidget {
  const ArtistPreviewCard({super.key, required this.artistName, required this.photoUrl});

  final String photoUrl;
  final String artistName;

  @override
  Widget build(BuildContext context) => Card(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: ClipOval(
            child: Image.network(
              photoUrl,
              width: 75, 
              height: 75,
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
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            artistName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
