part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MoviesState {}

final class MoviesErrorState extends MoviesState {
  final String message;

  const MoviesErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

final class MoviesLoadingState extends MoviesState {}

final class MoivesLoadedState extends MoviesState {
  final List<MovieModel> movies;
  final List<MoviesGenre> genres;
  final int currentPage;

  const MoivesLoadedState({
    this.movies = const [],
    this.genres = const [],
    this.currentPage = 0,
  });
  @override
  List<Object> get props => [movies, genres, currentPage];
}

final class MoivesLoadedMoreState extends MoviesState {
  final List<MovieModel> movies;
  final List<MoviesGenre> genres;
  final int currentPage;

  const MoivesLoadedMoreState({
    this.movies = const [],
    this.genres = const [],
    this.currentPage = 0,
  });
  @override
  List<Object> get props => [movies, genres, currentPage];
}
