
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/cubit/movies/movie_cast/movie_cast_cubit.dart';
import 'package:movie_intern/theme/style.dart';

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
              return Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                state.movieCastModel.crew!.length,
                (index) => state.movieCastModel.crew![index].job == job
                    ? Text(
                        '${state.movieCastModel.crew![index].name}',
                        style: DetailStyle().castStyle,
                      )
                    : Container(),
              ));
            } else {
              return const Text('Hi');
            }
          },
        ));
  }
}


