import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/category/ui/category_selection_view.dart';
import 'package:flutter_wallpapers/home/ui/home_view.dart';
import 'package:flutter_wallpapers/global_widgets/icon_widget.dart';
import 'package:flutter_wallpapers/specials/ui/special_select_view.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                iconName: 'Home',
                icon: Icon(Icons.home),
                navigationComponent: HomeView(),
              ),

              IconWidget(
                iconName: 'Categories',
                icon: Icon(Icons.category),
                navigationComponent: CategorySelectionView(),
              ),
              

              IconWidget(
                iconName: 'Specials',
                icon: Icon(Icons.celebration),
                navigationComponent: SpecialSelectionView(),
              ),

              IconWidget(
                iconName: 'Favourites',
                icon: Icon(Icons.favorite),
                navigationComponent: HomeView(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
