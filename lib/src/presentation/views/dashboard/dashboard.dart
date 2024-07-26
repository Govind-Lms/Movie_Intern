import 'package:flutter/material.dart';
import 'package:movie_intern/src/const/style.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/nowplaying_screen.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/top_rated_screen.dart';
import 'package:movie_intern/src/presentation/views/dashboard/views/popular_view.dart';
import 'package:movie_intern/src/presentation/views/dashboard/views/now_playing_view.dart';
import 'package:movie_intern/src/presentation/views/all_screen.dart/popular_screen.dart';
import 'package:movie_intern/src/presentation/views/dashboard/views/top_rated_view.dart';
import 'package:movie_intern/src/presentation/views/dashboard/views/trending_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const TrendingView(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: Style().categoryStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const PopularScreen()));
                        },
                        child: Text(
                          'More',
                          style: Style()
                              .categoryStyle
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                const PopularView(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Now Playing',
                        style: Style().categoryStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const NowPlayingScreen()));
                        },
                        child: Text(
                          'More',
                          style: Style()
                              .categoryStyle
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                const NowPlayingView(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Rated',
                        style: Style().categoryStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const TopRatedScreen()));
                        },
                        child: Text(
                          'More',
                          style: Style()
                              .categoryStyle
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                const TopRatedView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
