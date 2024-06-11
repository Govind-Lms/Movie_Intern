import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_intern/state_management/cubit/movies/movie_cast/movie_cast_cubit.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/theme/style.dart';
import 'package:movie_intern/views/casts/cast_screen.dart';
import 'package:movie_intern/views/widgets/conditions.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class CastPart extends StatelessWidget {
  final int movieId;
  const CastPart({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCastCubit()..fetchCastInfo(movieId),
      child: BlocBuilder<MovieCastCubit, MovieCastState>(
        builder: (context, state) {
          if (state is CastIsLoading) {
            return ShimmerPro.sized(
            light: ShimmerProLight.darker,
            scaffoldBackgroundColor: const Color.fromARGB(255, 50, 50, 50),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
          );
          } else if (state is CastIsError) {
            return Text(state.message);
          } else if (state is CastIsSuccess) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Cast',
                    style: DetailStyle().titleStyle,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieCastModel.cast!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final image =
                          state.movieCastModel.cast![index].profilePath;
                      return InkWell(
                        onTap: (){
                          showMaterialModalBottomSheet(context: context, builder: (context){
                            return  CastScreen(personId: state.movieCastModel.cast![index].id!);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal:10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                // margin: const EdgeInsets.only(left:20.0),
                                width: MediaQuery.of(context).size.width / 3,
                                height: MediaQuery.of(context).size.height / 5,
                                child: CachedNetworkImage(
                                  imageUrl:'$imageUrl/$image',
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.height / 5,
                                  errorWidget: (context, url, error) =>
                                      CachedNetworkImage(
                                    imageUrl:
                                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.height / 5,
                                  ),
                                ),
                              ),
                              Text(state.movieCastModel.cast![index].name.toString(),overflow: TextOverflow.ellipsis,style: DetailStyle().castStyle,),
                        
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const LoadingCondition();
          }
        },
      ),
    );
  }
}
