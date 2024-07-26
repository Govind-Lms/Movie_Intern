import 'package:dio/dio.dart';
import 'package:movie_intern/src/core/api_service/resp_obj.dart';
import 'package:movie_intern/src/const/constants.dart';

class HttpService {
  HttpService() {
    dio = Dio(baseOptions);
  }

  late final Dio dio;
  Map<String, String> get headers => {"accept": "application/json"};

  BaseOptions baseOptions = BaseOptions(baseUrl: baseUrl);


  Future<RespObj> get(String endPoint, {Map<String, dynamic>? params}) async {
    final Map<String,dynamic> api_key = {
      "api_key" : apiKey,
    };

    api_key.addAll(params ?? {});
    RespObj respObj;
    try {
      final response = await dio.get(baseUrl + endPoint, queryParameters: api_key);
      if (response.statusCode == 200) {
        respObj = RespObj(data: response.data, apiState: ApiState.success);
      } else {
        respObj = RespObj(data: "Something Wrong!", apiState: ApiState.success);
      }
      return respObj;
    } on DioException catch (e) {
      if (e.response != null) {
        RespObj respObj;
        final statusCode = e.response!.statusCode;
        if (statusCode == 404) {
          respObj = RespObj(
            data: "404 Page Not Found",
            apiState: ApiState.failure,
            errorState: ErrorState.notFound,
          );
        } else if (statusCode == 401) {
          respObj = RespObj(
            data: "401 Unauthorized Error",
            apiState: ApiState.failure,
            errorState: ErrorState.unauthorized,
          );
        } else if (statusCode == 403) {
          respObj = RespObj(
            data: "403 Forbidden Error",
            apiState: ApiState.failure,
            errorState: ErrorState.forbidden,
          );
        } else if (statusCode == 500) {
          respObj = RespObj(
            data: "500 Internal Server Error",
            apiState: ApiState.failure,
            errorState: ErrorState.server,
          );
        } else if (statusCode == 400) {
          respObj = RespObj(
            data: "400 Bad Request",
            apiState: ApiState.failure,
            errorState: ErrorState.badRequest,
          );
        } else if (statusCode == 429) {
          respObj = RespObj(
            data: "429 Too Many Request",
            apiState: ApiState.failure,
            errorState: ErrorState.tooManyRequest,
          );
        } else {
          respObj = RespObj(
            data: "Unknown",
            apiState: ApiState.failure,
            errorState: ErrorState.unknown,
          );
        }

        return respObj;
      }

      throw Exception(e.toString());
    }
  }
}
