import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.photoUrl, required this.imageSize, this.fit});

  final String photoUrl;
  final double imageSize;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => Image.network(
      photoUrl,
      width: imageSize, 
      height: imageSize,
      fit: fit, 
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
    );
}
