import 'package:movie_intern/src/core/api_service/http_service.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
class TrendingRepository {
  

  final httpService = HttpService();

  Future<RespObj> getTrendingMovies(String type,int page)async{
    final response = await httpService.get("trending/movie/$type",params: {
      "page": page,
    });
    return response;
  }


}