import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Api_manager.dart';
import 'package:movies/Provider/GenreProvider.dart';
import 'package:movies/browse/movieItem.dart';
import 'package:movies/model/MoviesResponse.dart';
import 'package:movies/myTheme.dart';
import 'package:provider/provider.dart';

class MoviesList extends StatefulWidget {
  static const String routeName = 'movies list';

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late GenreProvider genreProvider;

  bool isSelected = false;
 bool iswishlisted = false ;
  @override
  Widget build(BuildContext context) {
    genreProvider = Provider.of<GenreProvider>(context);

    return Container(
      color: MyTheme.blackColor,
      child: FutureBuilder<List<Results>>(
        future: ApiManager.getMovies(
            genreProvider.selectedgenreId.toString() ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.orangeColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return MovieItem(movie: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
