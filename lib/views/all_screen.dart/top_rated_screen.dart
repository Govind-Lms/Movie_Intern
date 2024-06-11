import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/models/movie_model.dart';
import 'package:movie_intern/state_management/bloc/top_rated/toprated_bloc.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/widgets/movie_list_tile.dart';
import 'package:movie_intern/views/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({super.key});

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  late TopratedBloc topratedBloc;
  @override
  void initState() {
    super.initState();
    topratedBloc = BlocProvider.of<TopratedBloc>(context);
    topratedBloc.add(GetTopRatedMovies());
  }
  RefreshController controller = RefreshController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated',style: Style().categoryStyle,),
      ),
      body: BlocConsumer<TopratedBloc, TopratedState>(
        listener: (context, state) {
          if (state is TopratedSuccess) {
            if (state.pageState == PageState.noMore) {
              controller.loadNoData();
            } else {
              controller.loadComplete();
            }
          }
        },
        builder: (context, state) {
          if (state is TopratedLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TopratedSuccess) {
            return RefreshWidget<Movies>(
              refreshController: controller,
              items: state.movies ?? [],
              enablePullUp: true,
              onLoading: ()=> topratedBloc.add(GetMoreTopRatedMovies()),
              onRefresh: ()=> topratedBloc.add(GetTopRatedMovies()),
              child: (movie) {
                return MovieListTile(movies: movie);
              },
            );
          } else if (state is TopratedError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
