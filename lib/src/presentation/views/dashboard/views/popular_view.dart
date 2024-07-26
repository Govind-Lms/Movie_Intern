import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/src/core/models/movie_model.dart';
import 'package:movie_intern/src/core/state_management/cubit/movies/popular_cubit/popular_cubit.dart';
import 'package:movie_intern/src/presentation/views/dashboard/components/movie_card_widget.dart';

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

            final jsonBody= state.respObj.data;
            final movieModel = MovieModel.fromJson(jsonBody);
            return MovieCardWidget(movie: movieModel.movies);
          } else {
            return  Text(
              'Error Occured IN View ${state.props}',
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
