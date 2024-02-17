import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';
import 'package:flutter_wallpapers/global_widgets/bottom_navigation_widget.dart';
import 'package:flutter_wallpapers/home/widgets/listview_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 1,

        //title of the appbar
        title: Row(
          children: [
            Text(
              'Explore',
              style: themeData.textTheme.labelLarge,
            ),
            const SizedBox(width: 6),
            GradientText(
              'diverse',
              colors: const [
                Color(0XFFD93FFF),
                Color(0XFFFF00B8),
              ],
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 6),
            Text(
              'images',
              style: themeData.textTheme.labelLarge,
            )
          ],
        ),

      
      ),

      bottomNavigationBar: const BottomNavigation(),

      //application body
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ListviewWidget(
              headline: 'Beautiful nature 🍁',
              category: 'nature',
            ),
            ListviewWidget(
              headline: 'Incredible India 🇮🇳',
              category: 'indian heritage',
            ),
            ListviewWidget(
              headline: 'Gaming all night 🎮',
              category: 'gaming',
            ),
            ListviewWidget(
              headline: 'Modern beauties 🥵',
              category: 'supercars',
            ),
            ListviewWidget(
              headline: 'Peaceful nights 🌌',
              category: 'night sky',
            ),
          ],
        ),
      ),
    );
  }
}
