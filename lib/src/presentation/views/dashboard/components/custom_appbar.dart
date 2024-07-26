import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_intern/src/presentation/views/search/search_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearchButton;

  const CustomAppBar({super.key, this.showSearchButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text('Search',style: GoogleFonts.oswald(),),
      elevation: 0.0,
      actions: [
        showSearchButton
            ? IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const SearchScreen()));
                },
              )
            : Container(),
        IconButton(
          icon: const Icon(
            Icons.settings,
          ),
          onPressed: () {},
        ),
      ],
      leading: const Icon(
        Icons.motion_photos_on_rounded,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
