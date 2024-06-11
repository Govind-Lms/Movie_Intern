
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_intern/views/all_screen.dart/popular_screen.dart';
import 'package:movie_intern/views/favorites/fav_screen.dart';
import 'package:movie_intern/views/genres/genre_screen.dart';
import '../dashboard/dashboard.dart';
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  
  var _bottomNavIndex = 0;
  
  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        Dashboard(),
        GenreScreen(),
        FavoriteScreen(),
        PopularScreen(),
      ][_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeColor: Colors.white,
        backgroundColor: Colors.black,
        inactiveColor: Colors.grey,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.sharpEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
          //other params
      ),

    );
  }
}