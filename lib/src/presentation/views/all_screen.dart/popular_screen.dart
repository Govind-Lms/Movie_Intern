import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_intern/src/core/models/movie_model.dart';
import 'package:movie_intern/src/core/state_management/cubit/movies/popular_cubit/popular_cubit.dart';
import 'package:movie_intern/src/const/style.dart';
import 'package:movie_intern/src/presentation/widgets/movie_list_tile.dart';
import 'package:movie_intern/src/presentation/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  RefreshController controller = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular',style: Style().categoryStyle,),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: BlocBuilder<PopularCubit, PopularState>(
                    builder: (context, state) {
                      if (state is IsPopularLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is IsPopularLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is IsPopularSuccess) {

                        final jsonBody= state.respObj.data;
                        final movieModel = MovieModel.fromJson(jsonBody);
                        return RefreshWidget(
                          refreshController: controller,
                          enablePullUp: true,
                          // onLoading: ()=> NowplayingCubit(),
                          onRefresh: (){
                            controller.refreshCompleted();
                          },
                          items: movieModel.movies,
                          child: (movie){
                            return MovieListTile(movies: movie);
                          },
                        );
                      } else {
                        return const Text(
                          'Error Occured',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
