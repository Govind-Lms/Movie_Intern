import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/cubit/movies/nowplaying_cubit/nowplaying_cubit.dart';
import 'package:movie_intern/models/models.dart';
import 'package:movie_intern/views/dashboard/components/movie_card_widget.dart';

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<NowplayingCubit, NowplayingState>(
      builder: (context, state) {
        if (state is NowplayingInitial) {
          return Text(state.props.toString());
        } else if (state is NowplayingIsLoading) {
          return Text(state.props.toString());
        } else if (state is NowplayingSuccess) {
          final jsonBody= state.respObj.data;
          final movieModel = MovieModel.fromJson(jsonBody);
          return SizedBox(
            height: MediaQuery.of(context).size.height/3,
            child: MovieCardWidget(movie: movieModel.movies,),
          );
        } else if(state is NowplayingError){
          return Text(state.errorState.toString());
        }
        else{
          return const Text('Something Wrong');
        }
      },
    );
  }
}

