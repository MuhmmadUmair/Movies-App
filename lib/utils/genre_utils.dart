import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/service/init_getit.dart';

class GenreUtils {
  static List<MovieGenres> genresName(List<int> genreIds) {
    final movieRepository = getIt<MoviesRepository>();
    final cachedGenres = [];
    List<MovieGenres> genresNames =
        []; //TODO: Add here the cachedGenres list here
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MovieGenres(id: 5448484, name: "Unknown"),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
