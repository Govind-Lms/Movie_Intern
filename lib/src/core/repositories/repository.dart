import 'package:movie_intern/src/core/api_service/http_service.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';

class MoviesInfoRepository{

  final httpService = HttpService();

  Future<RespObj> getMoviesInfo(int movieId) async{
    final response = await httpService.get("movie/$movieId",params: {
      "append_to_response" : "videos",
    });
    return response;
  }


  Future<RespObj> getCastInfo(int movieId) async{
    final response = await httpService.get("movie/$movieId/credits");
    return response;
  }

  Future<RespObj> getSimilarMovies(int movieId) async{
    final response = await httpService.get("movie/$movieId/similar");
    return response;
  }
}

class CastRepository{
  final httpService = HttpService();
  
  Future<RespObj> getCastPersonMovies(int personId) async{
    final response = await httpService.get('person/$personId/movie_credits');
    return response;
  }
  Future<RespObj> getCastPersonDetails(int personId) async{
    final response = await httpService.get('person/$personId');
    return response;
  }
}



