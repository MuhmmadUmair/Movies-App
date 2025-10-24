import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/view_models/movies/movies_state.dart';

final movieProvider = StateNotifierProvider<MoviesProvider, MoviesState>(
  (_) => MoviesProvider(),
);
final currentMovie = Provider.family<MoviesModel, int>((ref, index) {
  final movieState = ref.watch(movieProvider);
  return movieState.moviesList[index];
});

class MoviesProvider extends StateNotifier<MoviesState> {
  MoviesProvider() : super(MoviesState());
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();
  Future<void> getMovies() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      if (state.movieGenres.isEmpty) {
        final genresList = await _moviesRepository.fetchGenres();
        state = state.copyWith(movieGenres: genresList);
      }
      List<MoviesModel> movies = await _moviesRepository.fetchMovies(
        page: state.currentPage,
      );
      state = state.copyWith(
        moviesList: [...state.moviesList, ...movies],
        currentPage: state.currentPage + 1,
        fetchMoviesError: '',
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(fetchMoviesError: e.toString(), isLoading: false);
      rethrow;
    }
  }
}
