import 'package:flutter/material.dart';
import 'package:movies/Provider/GenreProvider.dart';
import 'package:movies/browse/GenreCategory.dart';
import 'package:movies/browse/MoviesList.dart';
import 'package:movies/model/Genres.dart';
import 'package:provider/provider.dart';


class CategoryList extends StatefulWidget {
  static const String routeName = 'category list';
     late int index ;
   late GenreProvider genreProvider;
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Genre> genresList = Genre.getGenres() ;

  @override
  Widget build(BuildContext context) {
    widget.genreProvider = Provider.of<GenreProvider>(context , listen : false);
    return
       Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Browse category',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30 , fontWeight: FontWeight.normal),),
          ),
      Expanded(
                child: GridView.count(
                  childAspectRatio: 3/2,
                  crossAxisCount: 2,
                  children: List.generate(genresList.length, (index) {
                    return Center(
                        child:GestureDetector(
                          onTap: (){
                         onCategoryClick(index);

                          },
                          child:GenreCategory(name: genresList[index].name , imageUrl: genresList[index].imageUrl,)
                        )
                    );
                  }
                  ),
                ),
              )

        ],
      );
  }

  void onCategoryClick(int index) {
    Navigator.pushNamed(context, MoviesList.routeName);
    widget.genreProvider.updateGenre(genresList[index] , genresList[index].id);
  }
}
