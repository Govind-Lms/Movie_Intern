import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/state_management/bloc/genre/genre_bloc.dart';
import 'package:movie_intern/views/widgets/movie_list_tile.dart';
import 'package:movie_intern/views/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GenreIdMoviesView extends StatefulWidget {

  final String name;
  const GenreIdMoviesView({super.key, required this.name});

  @override
  State<GenreIdMoviesView> createState() => _GenreIdMoviesViewState();
}

class _GenreIdMoviesViewState extends State<GenreIdMoviesView> {
  final refreshController = RefreshController();
  late GenreBloc genreBloc;

    @override
  void initState() {
    super.initState();
    genreBloc = BlocProvider.of<GenreBloc>(context);
    genreBloc.add(GetGenreMoviesList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocListener<GenreBloc, GenreState>(
        listener: (context, state) {
          if (state is GenreSuccess) {
            if (state.pageState == PageState.noMore) {
              refreshController.loadNoData();
            } else {
              refreshController.loadComplete();
            }
          }
        },
        child: BlocBuilder<GenreBloc, GenreState>(
          builder: (context, state) {
            if (state is GenreLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GenreSuccess) {
              return RefreshWidget(
                refreshController: refreshController,
                items: state.movies ?? [],
                onLoading: ()=> genreBloc.add(GetMoreGenreMoviesList()),
                onRefresh: ()=> genreBloc.add(GetGenreMoviesList()),
                enablePullUp: true,
                child: (movie){
                  return MovieListTile(movies: movie);
                },
              );
            } else if (state is GenreError) {
              return Text(state.message + state.errorState.toString());
            } else {
              return  const Center(child: Text('Initial'));
            }
          },
        ),
      ),
    );
  }
}
