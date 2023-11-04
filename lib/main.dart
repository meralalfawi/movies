import 'package:flutter/material.dart';
import 'package:movies/myTheme.dart';

import 'browse/category_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    initialRoute: CategoryList.routeName,
    routes: {
    CategoryList.routeName: (context) => CategoryList(),
    },
    theme: MyTheme.lightTheme,
    );
  }
}