      import 'package:flutter/material.dart';
      import 'package:flutter_bloc/flutter_bloc.dart';
      import 'package:movie_intern/src/core/api_service/resp_obj.dart';
      import 'package:movie_intern/src/core/state_management/bloc/now_playing/now_playing_bloc.dart';
      import 'package:movie_intern/src/const/style.dart';
      import 'package:movie_intern/src/presentation/widgets/movie_list_tile.dart';
      import 'package:movie_intern/src/presentation/widgets/refresh_widget.dart';
      import 'package:pull_to_refresh/pull_to_refresh.dart';

      import '../../../core/models/movie_model.dart';

      class NowPlayingScreen extends StatefulWidget {
        const 
        NowPlayingScreen({super.key});

        @override
        State<NowPlayingScreen> createState() => _NowPlayingPageState();
      }

      class _NowPlayingPageState extends State<NowPlayingScreen> {
        late NowPlayingBloc _nowPlayingBloc;

        @override
        void initState() {
          super.initState();
          _nowPlayingBloc = BlocProvider.of<NowPlayingBloc>(context);
          _nowPlayingBloc.add(GetNowPlaying());
        }

        final _refreshCtl = RefreshController();

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Now Playing',style: Style().categoryStyle,),
            ),
            body: BlocConsumer<NowPlayingBloc, NowPlayingState>(
              listener: (context, state) {
                if (state is NowPlayingSuccess) {
                  if (state.pageState == PageState.noMore) {
                    _refreshCtl.loadNoData();
                  } else {
                    _refreshCtl.loadComplete();
                  }
                }
              },
              builder: (context, state) {
                if (state is NowPlayingIsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NowPlayingSuccess) {
                  return RefreshWidget<Movies>(
                    refreshController: _refreshCtl,
                    items: state.movies ?? [],
                    enablePullUp: true,
                    onLoading: ()=> _nowPlayingBloc.add(GetMoreNowPlaying()),
                    onRefresh: ()=> _nowPlayingBloc.add(GetNowPlaying()),
                    child: (movie) {
                      return MovieListTile(movies: movie);
                    },
                  );
                } else if (state is NowPlayingError) {
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
