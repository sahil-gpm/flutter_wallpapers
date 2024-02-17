import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/category/ui/category_setwallpaper_view.dart';
import 'package:flutter_wallpapers/global_widgets/wallpaper_image_tile_widget.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:http/http.dart' as http;

class CategoryImageView extends StatefulWidget {
  final String category;
  const CategoryImageView({super.key, required this.category});

  @override
  State<CategoryImageView> createState() => _CategoryImageViewState();
}

class _CategoryImageViewState extends State<CategoryImageView> {
  //image list
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
              'https://api.pexels.com/v1/search?query=${widget.category}&per_page=120'),
          headers: {
            'Authorization':
                '9h7wo5t3PYYMck1QG0dW2eaxJVsp0jKkqB09f2AwHo4lXRsso90jkfIl'
          });
      Map<String, dynamic> data = json.decode(result.body);
      photoList = data["photos"];
      setState(() {});
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        // ignore: use_build_context_synchronously
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Check your internet connection"),
          showCloseIcon: true,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GradientText(
              widget.category,
              colors: const [
                Color(0XFFD93FFF),
                Color(0XFFFF00B8),
              ],
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 6),
            Text(
              'wallpapers',
              style: themeData.textTheme.labelLarge,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            photoList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black87),
                  )
                : Expanded(
                    child: GridView.builder(
                        itemCount: photoList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: .6),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SetWallpaperView(
                                            imageUrl: photoList[index]["src"]
                                                ["large2x"])));
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: WallpaperImageTileWidget(
                                    imageUrl: photoList[index]["src"]["medium"],
                                    width: 140,
                                    height: 118,
                                  )));
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
