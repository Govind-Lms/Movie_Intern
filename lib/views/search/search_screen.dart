import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_intern/state_management/cubit/searchs/search_movie/search_movie_cubit.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/views/details/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  @override
  void dispose() {
    _textFieldController.dispose();

    super.dispose();
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    context.read<SearchMovieCubit>().fetchSearchedMovies('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: TextField(
          autofocus: true,
          controller: _textFieldController,
          onChanged: (query) {
            context.read<SearchMovieCubit>().fetchSearchedMovies(query);
          },

          // onSubmitted: (query){
          //   context.read<SearchMovieCubit>().fetchSearchedMovies(query);
          // },
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _textFieldController.clear();
              context.read<SearchMovieCubit>().fetchSearchedMovies('');
            },
          ),
        ],
      ),
      body: BlocBuilder<SearchMovieCubit, SearchMovieState>(
        builder: (context, state) {
          if (state is SearchIsInitial) {
            return const Center(child: Text("Searchr"));
          } else if (state is SearchIsLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is SearchIsSuccess) {
            return _textFieldController.text.isNotEmpty
                ? ListView.builder(
                    itemCount: state.movieModel.results!.length,
                    itemBuilder: (context, index) {
                      var data = state.movieModel.results![index];
                      return state.movieModel.totalResults! != 0
                          ? ListTile(
                              onTap: () {
                                showMaterialModalBottomSheet(context: context, builder: (context) {
                                    return DetailsScreen(movieId: data.id!);
                                  });
                              },
                              leading: SizedBox(
                                height: 200,
                                child: CachedNetworkImage(
                                  imageUrl: '$imageUrl${data.posterPath}',
                                  height: 200.0,
                                  width: MediaQuery.of(context).size.width * .1,
                                  errorWidget: (context, url, error) =>
                                      const Placeholder(),
                                ),
                              ),
                              title: Text(
                                data.title.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                data.releaseDate!.length > 3
                                    ? data.releaseDate
                                        .toString()
                                        .substring(0, 4)
                                    : data.releaseDate.toString(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          : const Center(
                              child: Text('Movie Not Found..'),
                            );
                    },
                  )
                : const Center(
                    child: Text('Search..'),
                  );
          } else if (state is SearchIsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(child: Text(state.props.toString()));
          }
        },
      ),
    );
  }
}
