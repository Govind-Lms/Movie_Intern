import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_intern/const/constants.dart';

class PosterWidget extends StatelessWidget {
  final String poster;
  const PosterWidget({super.key,required this.poster});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {

        return const LinearGradient(
          
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstATop,
      child: CachedNetworkImage(
        imageUrl: '$imageUrl$poster',
        height: 500.0,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
