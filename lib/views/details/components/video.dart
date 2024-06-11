import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/cubit/movies/movie_details/movie_details_cubit.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/widgets/conditions.dart';
import 'package:url_launcher/url_launcher.dart';

import 'crew_info.dart';

Future<void> safeLaunchUrl(String urlString) async {
  try {
    // ignore: deprecated_member_use
    final bool launched = await launch(urlString);
    if (!launched) {
      // Handle the fact that the launch was not successful
      throw 'Failed to launch $urlString'; // `throw could not launch` is used for error handling
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
}

class VideoPart extends StatelessWidget {
  final int movieId;
  const VideoPart({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..fetchMoviesInfo(movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieIsLoading) {
            return const LoadingCondition();
          } else if (state is MovieIsError) {
            return Text(state.message);
          } else if (state is MovieIsSuccess) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Trailers / Videos',
                    style: DetailStyle().titleStyle,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Swiper(
                      autoplay: false,

                      // scrollDirection: Axis.horizontal,
                      itemCount: state.movieDetailModel.videos!.results!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            safeLaunchUrl('https://www.youtube.com/watch?v='
                                '${state.movieDetailModel.videos!.results![index].key}');
                          },
                          child: Card(
                            borderOnForeground: true,
                            margin: const EdgeInsets.only(right: 10.0),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '$imageUrl/${state.movieDetailModel.backdropPath}',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ExpandableNotifier(
                  child: Expandable(
                    collapsed: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ExpandableButton(
                        child: Row(
                          children: [
                            Text(
                              "About Movie",
                              textAlign: TextAlign.justify,
                              style: DetailStyle().titleStyle,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    expanded: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandableButton(
                            child: Row(
                              children: [
                                Text(
                                  "About Movie",
                                  textAlign: TextAlign.justify,
                                  style: DetailStyle().titleStyle,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_drop_up_sharp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Runtime',
                            style: DetailStyle().releaseDate,
                          ),
                          Text(
                            '${state.movieDetailModel.runtime!} mins',
                            style: DetailStyle().castStyle,
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          ///
                          Text(
                            'Writer',
                            style: DetailStyle().releaseDate,
                          ),
                          CrewInfo(
                            movieId: movieId,
                            job: 'Writer',
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          Text(
                            'Director',
                            style: DetailStyle().releaseDate,
                          ),
                          CrewInfo(
                            movieId: movieId,
                            job: 'Director',
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Release Data',
                            style: DetailStyle().releaseDate,
                          ),
                          Text(
                            '${state.movieDetailModel.releaseDate}',
                            style: DetailStyle().castStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ExpandableNotifier(
                  child: Expandable(
                    collapsed: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ExpandableButton(
                        child: Row(
                          children: [
                            Text(
                              "Movie on Boxoffice",
                              textAlign: TextAlign.justify,
                              style: DetailStyle().titleStyle,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    expanded: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandableButton(
                            child: Row(
                              children: [
                                Text(
                                  "Movie on Boxoffice",
                                  textAlign: TextAlign.justify,
                                  style: DetailStyle().titleStyle,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_drop_up_sharp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Rated',
                            style: DetailStyle().releaseDate,
                          ),
                          Text(
                            '${state.movieDetailModel.popularity!}',
                            style: DetailStyle().castStyle,
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          ///
                          Text(
                            'Budget',
                            style: DetailStyle().releaseDate,
                          ),
                          Text(
                            '${state.movieDetailModel.budget! / 1000000} Millions',
                            style: DetailStyle().castStyle,
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          Text(
                            'Boxoffice',
                            style: DetailStyle().releaseDate,
                          ),
                          Text(
                            '${state.movieDetailModel.revenue! / 1000000} Millions',
                            style: DetailStyle().castStyle,
                          ),
                        ],
                      ),
                    ),
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
