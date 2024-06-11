const apiKey = "4e8d1cbcdc8aba23c0a647dc18a5a708";
const baseUrl = "https://api.themoviedb.org/3/";

const imageUrl = "https://image.tmdb.org/t/p/original";

const videoUrl = "https://api.themoviedb.org/3/";

const popularUrl = "$baseUrl/movie/popular?api_key=$apiKey";

String genreId  = '';

const searchMovieUrl =
      '$baseUrl/search/movie?api_key=$apiKey';


movieDetailUrl(int movieId) =>
    '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos';

movieCreditlUrl(int movieId) =>
    '$baseUrl/movie/$movieId/credits?api_key=$apiKey';
    
similarMovieUrl(int movieId) =>
    '$baseUrl/movie/$movieId/similar?api_key=$apiKey';

castMovieUrl(int personId) =>
    '$baseUrl/person/$personId/movie_credits?api_key=$apiKey';

castPersonUrl(int personId) =>
    '$baseUrl/person/$personId?api_key=$apiKey';
