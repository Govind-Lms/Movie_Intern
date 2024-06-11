
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/const/constants.dart';

import '../api_service/http_service.dart';

class GenreRepository {

  final httpService = HttpService();

  Future<RespObj> getGenreMovieList(String endPoint,int page) async {
    
    final response = await httpService.get(endPoint,params: {
      "page" : page,
      "api_key": apiKey,
      "with_genres" :genreId, 
    });

    return response;
  }
}