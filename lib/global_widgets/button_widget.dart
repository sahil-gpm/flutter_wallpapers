import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double height, width;
  final Function onTap;
  final Color backgroundColor;
  final int textColorSignal;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.onTap,
      required this.backgroundColor, required this.textColorSignal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          text,
          style: textColorSignal == 0 ? themeData.textTheme.labelSmall : themeData.textTheme.displaySmall,
        )),
      ),
    )
        .animate()
        .fadeIn(
            duration: const Duration(milliseconds: 3000),
            curve: Curves.fastLinearToSlowEaseIn)
        .slideY(begin: 10, end: 0);
  }
}
