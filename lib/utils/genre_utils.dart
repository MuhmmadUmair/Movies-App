import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/view_models/movies/movies_provider.dart';

class GenreUtils {
  static List<MovieGenres> movieGenresNames(List<int> genreIds, WidgetRef ref) {
    final movieState = ref.watch(movieProvider);
    // final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres =
        movieState.movieGenres; //TODO: We need to get the correct cachedGenres
    List<MovieGenres> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MovieGenres(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
