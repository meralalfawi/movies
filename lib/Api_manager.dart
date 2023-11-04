import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/Api_constants.dart';
import 'package:movies/model/MoviesCategories.dart';
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
}