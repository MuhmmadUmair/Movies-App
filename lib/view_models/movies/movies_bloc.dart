import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movies_genre.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/service/init_getit.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMoviesEvent>(_onFetchMovies);
    on<FetchMoreMoviesEvent>(_onFetchMoreMovies);
  }
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();
  Future<void> _onFetchMovies(
    MoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoadingState());
    try {
      var movies = await _moviesRepository.fetchMovies(page: 1);
      var genres = await _moviesRepository.fetchGenres();

      emit(MoivesLoadedState(currentPage: 1, genres: genres, movies: movies));
    } catch (error) {
      emit(MoviesErrorState(message: 'Failed to load movies $error'));
    }
  }

  Future<void> _onFetchMoreMovies(
    MoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final currentState = state;
    if (currentState is MoivesLoadedMoreState) {
      return;
    }
    if (currentState is! MoivesLoadedState) {
      return;
    }
    emit(
      MoivesLoadedMoreState(
        currentPage: currentState.currentPage,
        genres: currentState.genres,
        movies: currentState.movies,
      ),
    );

    try {
      final List<MovieModel> movies = await _moviesRepository.fetchMovies(
        page: currentState.currentPage + 1,
      );
      if (movies.isEmpty) {
        emit(currentState);
        return;
      }
      currentState.movies.addAll(movies);
      emit(
        MoivesLoadedState(
          currentPage: currentState.currentPage + 1,
          genres: currentState.genres,
          movies: currentState.movies,
        ),
      );
    } catch (e) {
      emit(MoviesErrorState(message: 'Failed to load movies $e'));
    }
  }
}
