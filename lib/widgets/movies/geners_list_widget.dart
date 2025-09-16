import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/utils/genre_utils.dart';

class GenersListWidget extends StatelessWidget {
  const GenersListWidget({super.key, required this.moviesModel});
  final MoviesModel moviesModel;
  @override
  Widget build(BuildContext context) {
    List<GenresList> moviesGenre = GenreUtils.genresName(
      moviesModel.genreIds,
      context,
    );
    return Wrap(
      children: List.generate(
        moviesGenre.length,
        (index) =>
            chipWidget(genreName: moviesGenre[index].name, context: context),
      ),
    );
  }
}

Widget chipWidget({required String genreName, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).colorScheme.surface),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Text(genreName, style: TextStyle(fontSize: 14)),
      ),
    ),
  );
}
