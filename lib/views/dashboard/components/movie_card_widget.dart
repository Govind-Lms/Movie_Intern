import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/models/movie_model.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/details/detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final List<Movies>? movie;
  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movie?.length,
      itemBuilder: (BuildContext context, int index) {
        final movies = movie!;
        return InkWell(
          onTap: () {
            debugPrint(movies[index].id.toString());
            showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  return DetailsScreen(movieId: movies[index].id);
                });
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: '$imageUrl${movies[index].posterPath}',
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 4.5,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies[index].title ?? "",
                        style: PopularStyle().titleStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        movies[index].releaseDate ?? "",
                        style: PopularStyle().releaseDate,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
