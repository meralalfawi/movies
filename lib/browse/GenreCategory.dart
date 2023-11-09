import 'package:flutter/material.dart';

class GenreCategory extends StatelessWidget {
  String name;
String imageUrl ;
  GenreCategory({required this.name , required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child:
              Image.asset(imageUrl)),
        ),
        Text(name ,
          style: Theme.of(context).textTheme.titleMedium,),

      ],

    );
  }
}
