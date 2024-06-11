import 'package:dio/dio.dart';
import 'package:movie_intern/const/constants.dart';
import 'package:movie_intern/models/movie_cast.dart';
import 'package:movie_intern/models/similar_model.dart';
import 'package:movie_intern/models/models.dart';

class ApiRepoImplementation{

  final Dio dio = Dio();
  
  Future<MovieModel> getModel(String type) async{

    final response = await dio.get('$baseUrl/movie/$type?api_key=$apiKey');
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      final data = MovieModel.fromJson(jsonBody);
      return data;
    } 
    else {
      throw Exception('Fail to load model');
    }
  }



  Future<MovieDetailsModel> getMoviesInfo(int movieId) async{

    final response = await dio.get(movieDetailUrl(movieId));
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      final data = MovieDetailsModel.fromJson(jsonBody);

      return data;
    } 
    else {
      throw Exception('Fail to load movies info');
    }
  }


  Future<MovieCastModel> getCastInfo(int movieId) async{
    final response = await dio.get(movieCreditlUrl(movieId));
    if(response.statusCode == 200){
      final jsonBody = response.data;
      // print(jsonBody);
      final data= MovieCastModel.fromJson(jsonBody);
      return data;
    }
    else{
      throw Exception('Fail to load cast info');
    }
  }

  Future<SimilarMovieModel> getSimilarMovies(int movieId) async{
    final response = await dio.get(similarMovieUrl(movieId));
    if(response.statusCode == 200){
      final jsonBody = response.data;
      final data= SimilarMovieModel.fromJson(jsonBody);
      return data;
    }
    else{
      throw Exception('Fail to load cast info');
    }
  }


}

class CastRepository{
  final Dio dio = Dio();
  
  Future<CastMovieModel> getCastPersonMovies(int personId) async{
    final response = await dio.get(castMovieUrl(personId));
    if(response.statusCode == 200){
      final jsonBody = response.data;
      final data= CastMovieModel.fromJson(jsonBody);
      return data;
    }
    else{
      throw Exception('Fail to load cast movie info');
    }
  }
   Future<CastInfoModel> getCastPersonDetails(int personId) async{
    final response = await dio.get(castPersonUrl(personId));
    if(response.statusCode == 200){
      final jsonBody = response.data;
      final data= CastInfoModel.fromJson(jsonBody);
      return data;
    }
    else{
      throw Exception('Fail to load cast movie info');
    }
  }
}



