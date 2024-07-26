const apiKey = "7df1d448f9143917711eeeadf2fc7c48";
const baseUrl = "https://api.themoviedb.org/3/";

const imageUrl = "https://image.tmdb.org/t/p/original";

const videoUrl = "https://api.themoviedb.org/3/";

String genreId  = '';

castMovieUrl(int personId) =>
    'person/$personId/movie_credits?api_key=$apiKey';

castPersonUrl(int personId) =>
    'person/$personId';
