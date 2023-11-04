import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color whiteColor = Color(0xffffffff);
  static const Color orangeColor = Color(0xffFFA90A);
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: whiteColor ,
          fontSize: 24 ,
          fontWeight: FontWeight.w700),
      titleMedium:  TextStyle(color: whiteColor ,
          fontSize: 20 ,
          fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: whiteColor ,
          fontSize: 18 ,
          fontWeight: FontWeight.w700
      )
    )
  );


}