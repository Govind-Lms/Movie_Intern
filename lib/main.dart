import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/state_management/bloc/genre/genre_bloc.dart';
import 'package:movie_intern/state_management/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie_intern/state_management/bloc/top_rated/toprated_bloc.dart';
import 'package:movie_intern/state_management/bloc/trending/trending_bloc.dart';
import 'package:movie_intern/state_management/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_intern/state_management/cubit/movies/nowplaying_cubit/nowplaying_cubit.dart';
import 'package:movie_intern/state_management/cubit/searchs/search_movie/search_movie_cubit.dart';
import 'package:movie_intern/views/all_screen.dart/bottom_nav.dart';
import 'state_management/cubit/movies/popular_cubit/popular_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularCubit>(
            create: (context) => PopularCubit()..getPopularMovies()),
        BlocProvider<NowplayingCubit>(
            create: (context) => NowplayingCubit()..getNowPlaying()),
        BlocProvider<SearchMovieCubit>(create: (context) => SearchMovieCubit()),
        BlocProvider(create: (context) => NowPlayingBloc()),
        BlocProvider(create: (context) => GenreBloc()),
        BlocProvider(create: (context) => TopratedBloc()..add(GetTopRatedMovies())),
        BlocProvider(create: (context) => TrendingBloc()..add(GetTrendingMoviesEvent())),
        BlocProvider(create: (context) => UpcomingBloc()..add(GetUpcomingMovieListEvent())),

      ],
      child: MaterialApp(
        title: 'Movie API',
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: const BottomNavScreen(),
      ),
    );
  }
}
