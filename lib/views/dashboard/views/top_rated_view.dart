import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/bloc/top_rated/toprated_bloc.dart';
import 'package:movie_intern/views/dashboard/components/movie_card_widget.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: BlocBuilder<TopratedBloc, TopratedState>(
        builder: (context, state) {
          if (state is TopratedError) {
            return  Text(
              '${state.errorState}\n${state.message}',
            );
          } else if (state is TopratedLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopratedSuccess) {
            return MovieCardWidget(
              movie: state.movies,
            );
          } else {
            return  Text('Initial ${state.props}');
          }
        },
      ),
    );
  }
}
