import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/category/ui/category_image_view.dart';
import 'package:flutter_wallpapers/category/widgets/category_tile_widget.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';
import 'package:flutter_wallpapers/global_widgets/bottom_navigation_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SpecialSelectionView extends StatefulWidget {
  const SpecialSelectionView({super.key});

  @override
  State<SpecialSelectionView> createState() => _CategorySelectionViewState();
}

class _CategorySelectionViewState extends State<SpecialSelectionView> {
  //list for category names
  List<String> cats = [
    "Colors",
    "Art",
    "Cats",
    "Tigers",
    "Cartoons",
    "Food",
    "Moon",
    "Travel",
    "Railways",
    "Aesthetic",
  ];

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
              'Some',
              style: themeData.textTheme.labelLarge,
            ),
            const SizedBox(width: 6),
            GradientText(
              'specials',
              colors: const [
                Color(0XFFD93FFF),
                Color(0XFFFF00B8),
              ],
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
             Text(
              ' 🎉',
              style: themeData.textTheme.labelLarge,
            ),
          ],
        ),

       
      ),

      bottomNavigationBar: const BottomNavigation(),

      //application body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: cats.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: .6),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryImageView(category: cats[index])));
                    },
                    child: CategoryTileWidget(
                        categoryImagePath: 'assets/specials/cat${index + 1}.png',
                        categoryName: cats[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
