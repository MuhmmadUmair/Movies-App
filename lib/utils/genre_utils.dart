import 'package:movie_app/models/movie_genres.dart';
import '../repository/movies_repo.dart';
import '../service/init_getit.dart';

class GenreUtils {
  static List<GenresList> movieGenresNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepository>();
    final cachedGenres = []; //TODO: We need to get the correct cachedGenres
    List<GenresList> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => GenresList(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
