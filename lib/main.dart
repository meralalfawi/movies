import 'package:flutter/material.dart';
import 'package:movies/Provider/GenreProvider.dart';
import 'package:movies/browse/MoviesList.dart';
import 'package:movies/myTheme.dart';
import 'package:provider/provider.dart';

import 'browse/category_list.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<GenreProvider>(
          create: (_) => GenreProvider(),
        ),

      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    initialRoute: CategoryList.routeName,
    routes: {
    CategoryList.routeName: (context) => CategoryList(),
      MoviesList.routeName: (context) => MoviesList(),
    },
    theme: MyTheme.lightTheme,
    );
  }
}