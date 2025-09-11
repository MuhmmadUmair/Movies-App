import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';

class FavouriteBtn extends StatefulWidget {
  const FavouriteBtn({super.key, required this.moviesModel});
  final MoviesModel moviesModel;

  @override
  State<FavouriteBtn> createState() => _FavouriteBtnState();
}

class _FavouriteBtnState extends State<FavouriteBtn> {
  final favouriteMovieIds = [];
  @override
  Widget build(BuildContext context) {
    final isFavourite = favouriteMovieIds.contains(widget.moviesModel.id);
    return IconButton(
      onPressed: () {
        setState(() {
          if (isFavourite) {
            favouriteMovieIds.remove(widget.moviesModel.id);
          } else {
            favouriteMovieIds.add(widget.moviesModel.id);
          }
        });
      },
      icon: isFavourite
          ? Icon(MyAppIcons.favouriteRounded, color: Colors.red)
          : Icon(MyAppIcons.favoriteOutline),
    );
  }
}
