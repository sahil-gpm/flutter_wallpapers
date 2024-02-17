
import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/global_widgets/button_widget.dart';
import 'package:flutter_wallpapers/global_widgets/wallpaper_image_tile_widget.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';

class SetWallpaperView extends StatefulWidget {
  final String imageUrl;
  const SetWallpaperView({super.key, required this.imageUrl});

  @override
  State<SetWallpaperView> createState() => _SetWallpaperViewState();
}

class _SetWallpaperViewState extends State<SetWallpaperView> {
  setNewWallpaper() async {
    //some one implement this feature for me 🥲
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //image to display
          Column(
            children: [
              Expanded(
                  child: WallpaperImageTileWidget(
                imageUrl: widget.imageUrl,
                width: double.infinity,
                height: double.infinity,
              )),
            ],
          ),

          //the back button
          Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ))),

          //like button
          Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red[300],
                    size: 30,
                  ))),

          // date and time
          Positioned(
            top: MediaQuery.of(context).size.height * .15,
            child: Text(
                "${DateTime.now().hour >= 10 ? DateTime.now().hour : "0${DateTime.now().hour}"} : ${DateTime.now().minute >= 10 ? DateTime.now().minute : "0${DateTime.now().minute}"} ${DateTime.now().hour >= 12 ? "PM" : "AM"}",
                style: themeData.textTheme.displayLarge),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * .21,
            child: Text(
              "${DateTime.now().day}  ${DateTime.now().month >= 10 ? DateTime.now().month : "0${DateTime.now().month}"} ${DateTime.now().year}",
              style: themeData.textTheme.displaySmall,
            ),
          ),

          //the buttons for further actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                    text: "Set as lock screen",
                    height: 50,
                    width: double.infinity,
                    onTap: () {
                      setNewWallpaper();
                    },
                    backgroundColor: Colors.white,
                    textColorSignal: 0),
                const SizedBox(height: 8),
                ButtonWidget(
                    text: "Set as home screen",
                    height: 50,
                    width: double.infinity,
                    onTap: () {
                      setNewWallpaper();
                    },
                    backgroundColor: Colors.white,
                    textColorSignal: 0),
                const SizedBox(height: 8),
                ButtonWidget(
                    text: "Set as both",
                    height: 50,
                    width: double.infinity,
                    onTap: () {
                      setNewWallpaper();
                    },
                    backgroundColor: Colors.black,
                    textColorSignal: 1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
