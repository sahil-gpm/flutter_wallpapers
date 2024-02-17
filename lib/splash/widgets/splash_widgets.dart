import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';


//======================================================================================
//animating line widget
class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 222,
      color: Colors.black,
    )
        .animate()
        .fadeIn(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn)
        .scaleX(
            alignment: Alignment.bottomLeft,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn);
  }
}


//======================================================================================
//the stack widget in the middle
class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Image.asset(
          'assets/categories/cat12.png',
          width: MediaQuery.of(context).size.width * .9,
          height: 570,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black26,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FlutterWallpapers",
                style: themeData.textTheme.displayLarge,
              )
                  .animate()
                  .slideY(
                      begin: 10,
                      end: 0,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.fastLinearToSlowEaseIn)
                  .fadeIn(
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.fastLinearToSlowEaseIn),
              Text(
                "Explore thousands of vivid wallpapers and images. Browse within different categories and choose the ideal image for you ",
                style: themeData.textTheme.displaySmall,
              )
                  .animate()
                  .slideY(
                      begin: 10,
                      end: 0,
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.fastLinearToSlowEaseIn)
                  .fadeIn(
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.fastLinearToSlowEaseIn),
            ],
          ),
        )
      ]),
    ) //animate the main image
        .animate()
        .fadeIn(
            duration: const Duration(milliseconds: 3000),
            curve: Curves.decelerate)
        .shimmer(
            duration: const Duration(milliseconds: 3000),
            curve: Curves.decelerate);
  }
}





