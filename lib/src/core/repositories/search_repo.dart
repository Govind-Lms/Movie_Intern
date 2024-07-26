import 'package:movie_intern/src/core/api_service/http_service.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
class SearchRepository{
  final httpService = HttpService();
  
  Future<RespObj> getSearchMovieLists(String query) async{
    final response = await httpService.get('search/movie',params: {
      "query" : query,
    });
    return response;
  }
}
