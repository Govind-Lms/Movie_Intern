import 'package:movie_intern/api_service/http_service.dart';
import 'package:movie_intern/api_service/resp_obj.dart';
import 'package:movie_intern/const/constants.dart';

class TrendingRepository {
  

  final httpService = HttpService();

  Future<RespObj> getTrendingMovies(String type,int page)async{
    final response = await httpService.get("trending/movie/$type",params: {
      "page": page,
      "api_key": apiKey,
    });
    return response;
  }


}