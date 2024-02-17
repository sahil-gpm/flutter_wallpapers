import 'package:flutter/material.dart';

class WallpaperImageTileWidget extends StatelessWidget {

  final String imageUrl;
  final double width;
  final double height;
  const WallpaperImageTileWidget({super.key, required this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.darken,
      color: Colors.black12,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return SizedBox(
            width: width,
            height: height,
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.black87,
            )),
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.black12,
          child: const Icon(Icons.error_outline, size: 40),
        );
      },
    );
  }
}
