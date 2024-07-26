import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
import 'package:movie_intern/src/core/models/movie_model.dart';
import 'package:movie_intern/src/core/state_management/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_intern/src/const/style.dart';
import 'package:movie_intern/src/presentation/widgets/movie_list_tile.dart';
import 'package:movie_intern/src/presentation/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  late UpcomingBloc upcomingBloc;
  @override
  void initState() {
    super.initState();
    upcomingBloc = BlocProvider.of<UpcomingBloc>(context);
    // upcomingBloc.add(GetUpcomingMovieList());
  }
  RefreshController controller = RefreshController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Upcoming',style: Style().categoryStyle,),
      ),
      body: BlocConsumer<UpcomingBloc, UpcomingState>(
        listener: (context, state) {
          if (state is UpcomingSuccess) {
            if (state.pageState == PageState.noMore) {
              controller.loadNoData();
            } else {
              controller.loadComplete();
            }
          }
        },
        builder: (context, state) {
          if (state is UpcomingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UpcomingSuccess) {
            return RefreshWidget<Movies>(
              refreshController: controller,
              items: state.movies ?? [],
              enablePullUp: true,
              onLoading: ()=> upcomingBloc.add(GetMoreUpcomingMovieListEvent()),
              onRefresh: ()=> upcomingBloc.add(GetUpcomingMovieListEvent()),
              child: (movie) {
                return MovieListTile(movies: movie);
              },
            );
          } else if (state is UpcomingError) {
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
