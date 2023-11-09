import 'package:flutter/foundation.dart';
import 'package:movies/model/Genres.dart';
import 'package:movies/model/MoviesCategories.dart';

class GenreProvider extends ChangeNotifier{
Genre? selectedgenre ;
num? selectedgenreId ;
 void updateGenre(Genre newgenre , num genreId){
  selectedgenre = newgenre ;
   selectedgenreId = genreId ;
  notifyListeners();
}
}