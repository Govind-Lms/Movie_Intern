part of 'genre_bloc.dart';

sealed class GenreEvent extends Equatable {
  const GenreEvent();

  @override
  List<Object> get props => [];
}


final class GetGenreMoviesList extends GenreEvent{
  
}

final class GetMoreGenreMoviesList extends GenreEvent{
  
}