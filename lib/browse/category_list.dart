import 'package:flutter/material.dart';
import 'package:movies/Api_manager.dart';
import 'package:movies/myTheme.dart';
import '../model/MoviesCategories.dart';
class CategoryList extends StatelessWidget {
 static const String routeName = 'categoryList';

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Colors.black ,
      body: FutureBuilder<MoviesCategories>(
        future:ApiManager.getGenres() ,builder: (context , snapshot){
    if(snapshot.connectionState == ConnectionState.waiting){
    return Center(
    child: CircularProgressIndicator(

    ),
    );
    } else if(snapshot.hasError){
    return Column(children: [
    Text('Something went wrong' , style: TextStyle(color: Colors.white),),
    ElevatedButton(onPressed: (){
    ApiManager.getGenres();

    }, child: Text(snapshot.error.toString() ?? 'Try Again'))
    ],);
    }

    var genresList = snapshot.data?.genres ?? [] ;
    return ListView.builder(itemBuilder: (context , index){
      Text(  genresList[index].name ?? 'none' ,
        style: TextStyle(color: Colors.white), );
    } , itemCount: genresList.length,);

      },)
    );
  }
}
