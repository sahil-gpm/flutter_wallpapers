import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';

class CategoryTileWidget extends StatelessWidget {
  final String categoryImagePath;
  final String categoryName;
  const CategoryTileWidget(
      {super.key, required this.categoryImagePath, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    //stack
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              categoryImagePath,
              fit: BoxFit.cover,
              width: 300,
              height: 700,
              colorBlendMode: BlendMode.darken,
              color: Colors.black38,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9),
          child: Text(
            categoryName,
            style: themeData.textTheme.displayMedium,
          ),
        )
      ],
    )
        .animate()
        .fadeIn(
            duration: const Duration(
              milliseconds: 2000,
            ),
            curve: Curves.decelerate)
        .shimmer(
            duration: const Duration(
              milliseconds: 2000,
            ),
            curve: Curves.decelerate);
  }
}
