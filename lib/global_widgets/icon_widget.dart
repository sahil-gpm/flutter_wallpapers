import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/themes/my_themes.dart';

class IconWidget extends StatelessWidget {

  final Icon icon;
  final dynamic navigationComponent;
  final String iconName;
  const IconWidget({super.key, required this.icon, this.navigationComponent, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        IconButton(
          tooltip: iconName,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>navigationComponent));
            },
            icon: icon),

        Text(iconName,style: themeData.textTheme.labelSmall),
        const SizedBox(height: 10,)
      ],
    );
  }
}