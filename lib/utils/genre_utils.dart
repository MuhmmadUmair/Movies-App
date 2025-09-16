import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/view_model/movies_provider.dart';
import 'package:provider/provider.dart';

class GenreUtils {
  static List<GenresList> genresName(List<int> genreIds, BuildContext context) {
    final movieModelProvider = Provider.of<MoviesProvider>(context);
    final cachedGenres = movieModelProvider.genresList;
    List<GenresList> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => GenresList(id: 5448484, name: "Unknown"),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
