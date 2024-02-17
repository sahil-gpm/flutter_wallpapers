import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Colors.black
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 36,fontWeight: FontWeight.w500,color: Colors.white),
    displayMedium: TextStyle(fontSize: 28,fontWeight: FontWeight.w500,color: Colors.white),
    displaySmall: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),

    //for the appbar label
    labelLarge: TextStyle(fontSize: 23,fontWeight: FontWeight.w400,color: Colors.black),
    labelMedium: TextStyle(fontSize: 17.5,fontWeight: FontWeight.w400,color: Colors.black),
    labelSmall: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),
  )


);