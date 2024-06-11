import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_intern/state_management/cubit/movies/movie_details/movie_details_cubit.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/widgets/conditions.dart';
import 'package:movie_intern/views/details/components/poster.dart';
import 'package:movie_intern/views/details/components/video.dart';

class OverviewPart extends StatelessWidget {
  final int movieId;
  const OverviewPart({super.key,required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..fetchMoviesInfo(movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieIsLoading) {
            return const LoadingCondition();
          } else if (state is MovieIsError) {
            return const ErrorCondition();
          } else if (state is MovieIsSuccess) {
            final image = state.movieDetailModel.homepage;
            debugPrint("image $image");
            return Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: PosterWidget(
                          poster: state.movieDetailModel.posterPath.toString()),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 10,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              safeLaunchUrl(image.toString());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "$imageUrl${state.movieDetailModel.posterPath!}",
                                fit: BoxFit.cover,
                                width: 150,
                                height: 200.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.movieDetailModel.title.toString(),
                                maxLines: 2,
                                style: DetailStyle().titleStyle,
                              ),
                              Text(
                                state.movieDetailModel.releaseDate.toString(),
                                style: DetailStyle().releaseDate,
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating:
                                        state.movieDetailModel.voteAverage! / 2,
                                    itemCount: 5,
                                    itemSize: 24.0,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    state.movieDetailModel.voteAverage!
                                        .toStringAsFixed(2),
                                    style: DetailStyle().ratingStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: List.generate(
                    state.movieDetailModel.genres!.length,
                    (index) => TextButton(
                      onPressed: () {},
                      child: Text(
                        state.movieDetailModel.genres![index].name!,
                        style:
                            DetailStyle().releaseDate.copyWith(fontSize: 12.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Overview',
                    style: DetailStyle().titleStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Text(
                    state.movieDetailModel.overview!,
                    style: DetailStyle().genreStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            );
          } else {
            return const LoadingCondition();
          }
        },
      ),
    );
  }
}
