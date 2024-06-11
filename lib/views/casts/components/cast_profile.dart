import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_intern/state_management/cubit/casts/cast_info/cast_info_cubit.dart';
import 'package:movie_intern/state_management/cubit/casts/cast_movies/cast_movies_cubit.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/widgets/conditions.dart';
import 'package:movie_intern/views/details/detail_screen.dart';

class ProfilePart extends StatelessWidget {
  final int personId;
  const ProfilePart({super.key, required this.personId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CastInfoCubit()..fetchCastInfo(personId),
        ),
        BlocProvider(
          create: (context) => CastMoviesCubit()..fetchCastMovieInfo(personId),
        ),
      ],
      child: Column(
        children: [
          BlocBuilder<CastInfoCubit, CastInfoState>(
            builder: (context, state) {
              if (state is PersonIsInitial) {
                debugPrint(state.message);
                return const LoadingCondition();
              } else if (state is PersonIsError) {
                return const ErrorCondition();
              } else if (state is PersonIsSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              '$imageUrl${state.castInfoModel.profilePath}',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          errorWidget: (context, url, error) =>
                              const Placeholder(),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(state.castInfoModel.name.toString(),
                                style: CastStyle().nameStyle),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('BIOGRAPHY', style: CastStyle().titleStyle),
                          Text(state.castInfoModel.biography.toString(),
                              textAlign: TextAlign.justify,
                              style: CastStyle().normalStyle),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('BIRTHDAY', style: CastStyle().titleStyle),
                          Text(state.castInfoModel.birthday.toString(),
                              style: CastStyle().normalStyle),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('DEATHDAY', style: CastStyle().titleStyle),
                          Text(state.castInfoModel.deathday ?? "Still Alive",
                              style: CastStyle().normalStyle),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('PLACE OF BIRTH', style: CastStyle().titleStyle),
                          Text(state.castInfoModel.placeOfBirth.toString(),
                              style: CastStyle().normalStyle),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('KNOWN FOR', style: CastStyle().titleStyle),
                          Text(
                              state.castInfoModel.knownForDepartment.toString(),
                              style: CastStyle().normalStyle),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('ALSO KNOWN AS', style: CastStyle().titleStyle),
                          Wrap(
                              children: List.generate(
                                  state.castInfoModel.alsoKnownAs!.length
                                      .toInt(),
                                  (index) => Container(
                                        margin: const EdgeInsets.all(10.0),
                                        child: Text(
                                          state.castInfoModel
                                              .alsoKnownAs![index].characters
                                              .toString(),
                                          style: CastStyle().normalStyle,
                                        ),
                                      ))),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const LoadingCondition();
              }
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Played Movies',
              style: Style().categoryStyle,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: BlocBuilder<CastMoviesCubit, CastMoviesState>(
              builder: (context, state) {
                if (state is PersonMovieIsInitial) {
                  debugPrint(state.message);
                  return const LoadingCondition();
                } else if (state is PersonMovieIsError) {
                  return const ErrorCondition();
                } else if (state is PersonMovieIsSuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.castInfoModel.cast!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movies = state.castInfoModel.cast!;
                      return InkWell(
                        onTap: () {
                          debugPrint(movies[index].id.toString());
                          showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return DetailsScreen(
                                    movieId: movies[index].id!);
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '$imageUrl${movies[index].posterPath}',
                                width: MediaQuery.of(context).size.width / 2.5,
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                fit: BoxFit.fitWidth,
                                errorWidget: (context, url, error) =>
                                    const Placeholder(),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movies[index].title!,
                                      style: PopularStyle().titleStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      movies[index].releaseDate!,
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
                } else {
                  return const LoadingCondition();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
