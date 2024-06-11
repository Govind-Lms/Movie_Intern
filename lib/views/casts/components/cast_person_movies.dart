// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:movie_intern/bloc/casts/cast_movies/cast_movies_cubit.dart';
// import 'package:movie_intern/const/constants.dart';
// import 'package:movie_intern/theme/style.dart';
// import 'package:movie_intern/views/conditions.dart';
// import 'package:movie_intern/views/details/detail_screen.dart';

// class CastMoviesPart extends StatelessWidget {
//   final int personId;
//   const CastMoviesPart({super.key, required this.personId});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CastMoviesCubit()..fetchCastMovieInfo(personId),
//       child: Container(
//         height: MediaQuery.of(context).size.height/3,
//         child: BlocBuilder<CastMoviesCubit, CastMoviesState>(
//           builder: (context, state) {
//             if (state is PersonMovieIsInitial) {
//               debugPrint(state.message);
//               return const LoadingCondition();
//             } else if (state is PersonMovieIsError) {
//               return const ErrorCondition();
//             } else if (state is PersonMovieIsSuccess) {
//               return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: state.castInfoModel.cast!.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final movies = state.castInfoModel.cast!;
//                     return InkWell(
//                       onTap: () {
//                         debugPrint(movies[index].id.toString());
//                         showMaterialModalBottomSheet(context: context, builder: (context) {
//                             return DetailsScreen(movieId: movies[index].id!);
//                           });
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 10.0),
//                         child: Column(
//                           children: [
//                             CachedNetworkImage(
//                               imageUrl: '$imageUrl${movies[index].posterPath}',
//                               width: MediaQuery.of(context).size.width / 2.5,
//                               height: MediaQuery.of(context).size.height / 4.5,
//                               fit: BoxFit.fitWidth,
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width / 2.5,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(movies[index].title!,style: PopularStyle().titleStyle,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                   Text(movies[index].releaseDate!,style: PopularStyle().releaseDate,maxLines: 1,overflow: TextOverflow.ellipsis,),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//             } else {
//               return const LoadingCondition();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
