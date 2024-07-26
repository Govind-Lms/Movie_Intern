import 'package:flutter/material.dart';
import 'package:movie_intern/src/presentation/views/details/components/cast.dart';
import 'package:movie_intern/src/presentation/views/details/components/overview.dart';
import 'package:movie_intern/src/presentation/views/details/components/similar.dart';
import 'package:movie_intern/src/presentation/views/details/components/video.dart';

class DetailsScreen extends StatefulWidget {
  final int? movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                OverviewPart(movieId: widget.movieId!),
                CastPart(movieId: widget.movieId!),
                VideoPart(movieId: widget.movieId!),
                SimilarPart(movieId: widget.movieId!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
