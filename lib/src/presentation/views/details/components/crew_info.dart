import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/src/core/models/movie_cast.dart';
import 'package:movie_intern/src/core/state_management/cubit/movies/movie_cast/movie_cast_cubit.dart';
import 'package:movie_intern/src/const/style.dart';

class CrewInfo extends StatelessWidget {
  final int movieId;
  final String job;
  const CrewInfo({super.key, required this.movieId, required this.job});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCastCubit()..fetchCastInfo(movieId),
      child: BlocBuilder<MovieCastCubit, MovieCastState>(
        builder: (context, state) {
          if (state is CastIsInitial) {
            return const Text('HiI');
          } else if (state is CastIsLoading) {
            return const Text('HiL');
          } else if (state is CastIsError) {
            return const Text('HiE');
          } else if (state is CastIsSuccess) {
            final results = MovieCastModel.fromJson(state.movieCastModel.data);
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  results.crew!.length,
                  (index) => results.crew![index].job == job
                      ? Text(
                          '${results.crew![index].name}',
                          style: DetailStyle().castStyle,
                        )
                      : Container(),
                ));
          } else {
            return const Text('Hi');
          }
        },
      ),
    );
  }
}
