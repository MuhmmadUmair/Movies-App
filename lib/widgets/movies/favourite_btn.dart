import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_model/favourites_provider.dart';
import 'package:provider/provider.dart';

class FavouriteBtn extends StatelessWidget {
  final MoviesModel moviesModel;
  const FavouriteBtn({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, FavouritesProvider favouriteProvider, _) {
        return IconButton(
          onPressed: () {
            favouriteProvider.addOrRemoveFavourites(moviesModel);
          },
          icon: favouriteProvider.isFavourite(moviesModel)
              ? Icon(MyAppIcons.favouriteRounded, color: Colors.red)
              : Icon(MyAppIcons.favoriteOutline),
        );
      },
    );
  }
}
