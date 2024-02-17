import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/global_widgets/wallpaper_image_tile_widget.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';
import 'package:http/http.dart' as http;

class ListviewWidget extends StatefulWidget {
  final String headline;
  final String category;

  // ignore: use_key_in_widget_constructors
  const ListviewWidget(
      {Key? key, required this.headline, required this.category});

  @override
  State<ListviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<ListviewWidget> {
  List<dynamic> photoList = List.empty();

  @override
  void initState() {
    fetchWallpapers();
    super.initState();
  }

  //local function to pull data from the pexels API
  fetchWallpapers() async {
    try {
      var result = await http.get(
          Uri.parse(
              'https://api.pexels.com/v1/search?query=${widget.category}&per_page=10'),
          headers: {
            'Authorization':
                '9h7wo5t3PYYMck1QG0dW2eaxJVsp0jKkqB09f2AwHo4lXRsso90jkfIl'
          });
      Map<String, dynamic> data = json.decode(result.body);
      photoList = data["photos"];
      setState(() {});
    } catch (e) {
      // ignore: use_build_context_synchronously
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Check your internet connection"),
          showCloseIcon: true,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            //row for the upper category introduction and the more button to see more articles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //small heading
                Text(
                  widget.headline,
                  style: themeData.textTheme.labelMedium,
                ),
                Text(
                  'More',
                  style: themeData.textTheme.labelSmall,
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            // ListView to actually render the images there
            SizedBox(
              height: 300,
              child: photoList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black87,
                    ))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal, // Scroll horizontally
                      shrinkWrap: true,
                      itemCount: photoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: WallpaperImageTileWidget(
                                  imageUrl: photoList[index]["src"]["medium"],
                                  width: 140,
                                  height: 118,
                                )));
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
