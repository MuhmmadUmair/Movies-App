import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_models/favourites/favourite_provider.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends ConsumerWidget {
  final MoviesModel moviesModel;
  const FavoriteBtnWidget({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(
      favouriteProvider.select((state) => state.favouriteList),
    );
    final isFavourite = favouriteList.any(
      (movie) => movie.id == moviesModel.id,
    );
    return IconButton(
      onPressed: () {
        ref.read(favouriteProvider.notifier).addOrRemoveFavourites(moviesModel);
      },
      icon: isFavourite
          ? Icon(
              MyAppIcons.favouriteRounded,
              color: Colors.red, // isFavorite ? Colors.red : null,
              size: 20,
            )
          : Icon(MyAppIcons.favoriteOutline, size: 20),
    );
  }
}
