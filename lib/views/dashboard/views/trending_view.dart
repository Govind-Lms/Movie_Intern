import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/bloc/trending/trending_bloc.dart';
import 'package:movie_intern/views/dashboard/components/carousel_item.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        if (state is TrendingInitial) {
          return Text(state.props.toString());
        } else if (state is TrendingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrendingSuccess) {
          return CarouselItem(movie: state.movies);
        } else {
          debugPrint(state.props.toString());
          return  Text(
            'Error Occured ${state.props.toString()}',
          );
        }
      },
    );
  }
}
