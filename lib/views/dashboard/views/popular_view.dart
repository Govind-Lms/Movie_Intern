import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/cubit/movies/popular_cubit/popular_cubit.dart';
import 'package:movie_intern/views/dashboard/components/movie_card_widget.dart';

class PopularView extends StatelessWidget {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: BlocBuilder<PopularCubit, PopularState>(
        builder: (context, state) {
          if (state is IsPopularLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is IsPopularLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is IsPopularSuccess) {
            return MovieCardWidget(movie: state.movies.movies);
          } else {
            return const Text(
              'Error Occured',
              style: TextStyle(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
