import 'package:flutter/material.dart';
import 'package:movies/Api_manager.dart';
import 'package:movies/Provider/GenreProvider.dart';
import 'package:movies/model/MoviesResponse.dart';
import 'package:movies/myTheme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class MoviesList extends StatefulWidget {
  static const String routeName = 'movies list';

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late GenreProvider genreProvider;

  bool isSelected =false ;

  @override
  Widget build(BuildContext context) {
    genreProvider = Provider.of<GenreProvider>(context);

    return Container(
      color: MyTheme.blackColor,
      child: FutureBuilder<List<Results>>(
        future: ApiManager.getMovies(genreProvider.selectedgenreId.toString() ?? ''),
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
                return Material(
                  child: Container(
                    color: MyTheme.blackColor,
                    child: Slidable(
                    startActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const DrawerMotion(),
                children: [
                SlidableAction(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
                onPressed: (context) {
                    isSelected == true ? isSelected=false :
                        isSelected = true ;
                    setState(() {

                    });
                },

                icon: isSelected == false ? Icons.add :
                          Icons.check,
                  backgroundColor: MyTheme.orangeColor,
                label: isSelected == false ? 'Watchlist' :
                'Added',
                ),
                ],
                ),
                      child: ListTile(

                        leading: SizedBox(
                            height: 100.0,
                            width: 100.0, // fixed width and height
                            child: Image.asset(
                              genreProvider.selectedgenre?.imageUrl ?? '',
                              fit: BoxFit.contain,
                            )),
                        shape: Border(
                          bottom:
                              BorderSide(color: MyTheme.orangeColor, width: 20),
                        ),
                        title: Text(
                          snapshot.data?[index].title ?? '',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                        subtitle: Text(snapshot.data?[index].releaseDate ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: MyTheme.greyColor)),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
