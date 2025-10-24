import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';

class MoviesState {
  final int currentPage;
  final List<MoviesModel> moviesList;
  final List<MovieGenres> movieGenres;
  final bool isLoading;
  final String fetchMoviesError;

  MoviesState({
    this.moviesList = const [],
    this.movieGenres = const [],
    this.isLoading = false,
    this.fetchMoviesError = '',
    this.currentPage = 1,
  });

  MoviesState copyWith({
    int? currentPage,
    List<MoviesModel>? moviesList,
    List<MovieGenres>? movieGenres,
    bool? isLoading,
    String? fetchMoviesError,
  }) {
    return MoviesState(
      currentPage: currentPage ?? this.currentPage,
      fetchMoviesError: fetchMoviesError ?? this.fetchMoviesError,
      isLoading: isLoading ?? this.isLoading,
      movieGenres: movieGenres ?? this.movieGenres,
      moviesList: moviesList ?? this.moviesList,
    );
  }
}
