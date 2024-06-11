import 'package:flutter/material.dart';
import 'package:movie_intern/views/casts/components/cast_profile.dart';

class CastScreen extends StatefulWidget {
  final int personId;
  const CastScreen({super.key,required this.personId});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfilePart(personId: widget.personId),
                  
                  // CastMoviesPart(personId: widget.personId,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
