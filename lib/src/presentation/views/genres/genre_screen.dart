import 'package:flutter/material.dart';
import 'package:movie_intern/src/const/constants.dart';
import 'package:movie_intern/src/core/models/genre_model.dart';
import 'package:movie_intern/src/const/style.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/nowplaying_screen.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/popular_screen.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/top_rated_screen.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/upcoming_screen.dart';
import 'package:movie_intern/src/presentation/views/genres/components/category_widget.dart';
import 'package:movie_intern/src/presentation/views/genres/components/genre_movies_view.dart';
import 'package:movie_intern/src/presentation/views/genres/components/search_widget.dart';
import 'package:page_transition/page_transition.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SearchWidget(),
                  Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Most View',
                        style: Style().categoryStyle,
                      )),
                ],
              ),
            ),
            SliverGrid.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return CategoryWidget(
                  cateName: mostViews[index].name,
                  onTap: () {
                    if (mostViews[index].name == 'Now Playing') {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: const NowPlayingScreen(),
                        ),
                      );
                    } else if (mostViews[index].name == 'Top Rated') {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: const TopRatedScreen(),
                        ),
                      );
                    } else if (mostViews[index].name == 'Popular') {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: const PopularScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: const UpcomingScreen(),
                        ),
                      );
                    }
                  },
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Browse All',
                    style: Style().categoryStyle,
                  )),
            ),
            SliverGrid.builder(
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return CategoryWidget(
                  cateName: genres[index].name,
                  onTap: () {
                    setState(() {
                      genreId = genres[index].id.toString();
                    });
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: GenreIdMoviesView(name: genres[index].name),
                      ),
                    );
                  },
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
