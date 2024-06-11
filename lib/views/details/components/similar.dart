import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_intern/state_management/cubit/movies/similar_movie/similar_movie_cubit.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/widgets/conditions.dart';
import 'package:movie_intern/views/details/detail_screen.dart';


class SimilarPart extends StatelessWidget {
  final int movieId;
  const SimilarPart({super.key,required this.movieId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: BlocProvider(
        create: (context) => SimilarMovieCubit()..fetchSimilarMovies(movieId),
        child: BlocBuilder<SimilarMovieCubit, SimilarMovieState>(
          builder: (context, state) {
            if (state is SimilarIsLoading) {
              return const LoadingCondition();
            } else if (state is SimilarIsError) {
              return Text(state.message);
            } else if (state is SimilarIsSuccess) {
              return  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movieModel.results!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movies = state.movieModel.results;
                    return InkWell(
                      onTap: (){
                        showMaterialModalBottomSheet(context: context, builder: (context) {
                          return DetailsScreen(movieId: movies[index].id!);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: '$imageUrl${movies![index].posterPath}',
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 4.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(movies[index].title.toString(),style: PopularStyle().titleStyle,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  Text(movies[index].releaseDate.toString(),style: PopularStyle().releaseDate,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
            } else {
              return const LoadingCondition();
            }
          },
        ),
      ),
    );
  }
}