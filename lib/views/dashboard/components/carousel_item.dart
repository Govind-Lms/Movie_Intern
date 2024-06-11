import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/models/movie_model.dart';
import 'package:movie_intern/theme/style.dart';

class CarouselItem extends StatelessWidget {
  final List<Movies>? movie;
  const CarouselItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final movies =movie!;

    return Stack(
      children: [
         Positioned(
                top: 50.0,
                left: 20.0,
                child: Text('Trending Now',style: Style().categoryStyle,),
                // child: buildFloatingSearchBar(context),
              ),
        CarouselSlider(
          items: List.generate(
            movies.length,
            (index) {
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      imageUrl: '$imageUrl${movies[index].backdropPath}',
                      height: 500.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movies[index].title ?? "Title",
                            style: CarouselStyle().titleStyle,
                          ),
                          Text(
                            movies[index].releaseDate ?? "Release Data",
                            style: CarouselStyle().releaseStyle,
                          ),
                          Text(
                            '',
                            style: CarouselStyle().releaseStyle,
                          ),
                          Text(
                            '',
                            style: CarouselStyle().releaseStyle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            disableCenter: true,
            viewportFraction: 1,
            height: 500.0,
            enlargeCenterPage: false,
            // onPageChanged: (index, reason) {
            //   setState(
            //     () {},
            //   );
            // },
          ),
        ),
      ],
    );
  }
}
