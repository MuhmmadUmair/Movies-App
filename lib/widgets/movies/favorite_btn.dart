import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/view_models/favourites/favouite_bloc.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends StatelessWidget {
  final MovieModel movieModel;
  const FavoriteBtnWidget({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouiteBloc, FavouiteState>(
      builder: (context, state) {
        bool isFavorite =
            (state is FavouiteLoaded) &&
            state.favourites.any((movie) => movie.id == movieModel.id);
        return IconButton(
          onPressed: () {
            getIt<FavouiteBloc>().add(
              isFavorite
                  ? RemoveFromFavourites(movieModel: movieModel)
                  : AddToFavourites(movieModel: movieModel),
            );
          },
          icon: Icon(
            isFavorite
                ? MyAppIcons.favorite
                : MyAppIcons.favoriteOutlineRounded,
            color: isFavorite ? Colors.red : null,
            size: 20,
          ),
        );
      },
    );
  }
}
