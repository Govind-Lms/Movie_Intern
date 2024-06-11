

import 'package:dio/dio.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/models/search_model.dart';

class SearchRepository{
  final Dio dio = Dio();
  
  Future<SearchModel> getSearchMovieLists(String query) async{
    final response = await dio.get('$searchMovieUrl&query=$query');
    if(response.statusCode == 200){
      final jsonBody = response.data;
      final data= SearchModel.fromJson(jsonBody);
      return data;
    }
    else{
      throw Exception('Fail to load search movie info');
    }
  }
}
