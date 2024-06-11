

import 'package:movie_intern/const/constants.dart';

import '../api_service/http_service.dart';
import '../api_service/resp_obj.dart';

class CategoryRepository {
  final httpService = HttpService();

  Future<RespObj> getRequiredMoviesLists(String type,int page) async {
    final response = await httpService.get("movie/$type", params: {
      "api_key" : apiKey,
      "page": page,
    });
    return response;
  }
}