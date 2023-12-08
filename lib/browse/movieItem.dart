import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/MoviesResponse.dart';

import '../myTheme.dart';

class MovieItem extends StatefulWidget{
  Results movie ;
  bool iswishlisted  ;
  MovieItem({required this.movie , this.iswishlisted = false});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
   return Material(
     child: Container(
         color: MyTheme.blackColor,
         padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 1),
         child: Row(
             children: [SizedBox(
               height: 150.0,
               width: 130, // fixed width and height
               child: ClipRRect(
                 child: Stack(

                   alignment: Alignment.topRight,
                   children:[
                     Container(
                         height: MediaQuery.sizeOf(context).height *0.45,
                         clipBehavior: Clip.antiAlias,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(2),
                         ),
                         child: Image.network(
                             fit: BoxFit.cover,
                             ("https://image.tmdb.org/t/p/w500" +
                                 widget.movie.posterPath!))),
                     InkWell(
                         onTap:(){
                           widget.iswishlisted == true ? widget.iswishlisted = false :
                           widget.iswishlisted = true;
                           setState(() {

                           });
                         },
                         child:
                         Icon(
                           widget.iswishlisted == false ?
                           Icons.bookmark_add_outlined  :
                           Icons.bookmark_added  ,
                           color:widget.iswishlisted == false ? Colors.white :
                           Colors.orange,))
                   ],
                 ),
               ),
             ),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                        widget.movie.title ?? '',
                         style: Theme.of(context).textTheme.titleLarge,
                       ),
                       Text(widget.movie.releaseDate ?? '',
                           style: Theme.of(context)
                               .textTheme
                               .titleSmall
                               ?.copyWith(color: MyTheme.greyColor)),
                       ExpandableText(
                           linkColor:MyTheme.orangeColor,
                           collapseText: 'show less',
                           expandText:'show more' ,
                           widget.movie.overview ?? '',
                           style: Theme.of(context)
                               .textTheme
                               .titleSmall
                               ?.copyWith(color: MyTheme.greyColor))
                     ],
                   ),
                 ),
               ),


             ])
     ),
   );
  }
}