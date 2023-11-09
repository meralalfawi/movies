import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/Api_constants.dart';
import 'package:movies/model/MoviesCategories.dart';
import 'package:movies/model/MoviesResponse.dart';
class ApiManager{

  static Future<MoviesCategories> getGenres()async{
    Uri url=Uri.https(ApiConstants.baseUrl , ApiConstants.GenresApi,
{'api_Key' : '4d7fd420e15d8234938331e529f8f2e4'});
    try{
var response = await http.get(url);
var bodyString = response.body ;
var json =jsonDecode(bodyString);
return MoviesCategories.fromJson(json);}
        catch(e){
      throw e ;
        }
  }

  static Future<List<Results>> getMovies(String genreId) async {
    var apiKey = '4d7fd420e15d8234938331e529f8f2e4';
    var withgenres = genreId ;
    var language = 'en_US';
    var page = 1 ;
    var url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.moviesApi,
      {'api_key': apiKey,
        'with_genres': withgenres ,
        'language': language
      },
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['results'];
      List<Results> movies = List<Results>.from(data.map((movieData) {
        return Results(
          id: movieData['id'],
          title: movieData['title'],
          overview: movieData['overview'],
          posterPath: movieData['poster_path'],
          releaseDate: movieData['release_date'],

        );
      }));

      return movies;

    } else {
      throw Exception('Failed to load movies list');
    }
  }

}
