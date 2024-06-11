import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/models/models.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/details/detail_screen.dart';

class MovieListTile extends StatelessWidget {
  final Movies movies;
   const MovieListTile({super.key,required this.movies});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showMaterialModalBottomSheet(context: context, builder: (_){
          return DetailsScreen(movieId: movies.id);
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: '$imageUrl${movies.posterPath}',
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 4,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies.title ?? "",
                      style: PopularStyle().titleStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      movies.releaseDate ?? "",
                      style: PopularStyle().releaseDate,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${movies.voteAverage!.toStringAsFixed(2)} / 10",
                      style: PopularStyle().ratingStyle,
                    ),
                    RatingBarIndicator(
                      rating: movies.voteAverage! / 2,
                      itemCount: 5,
                      itemSize: 24.0,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),

                    Text(
                      "${movies.genreIds!.map((e) => e.toString())} ",
                      style: PopularStyle().titleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
