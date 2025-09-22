import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';

class FavouriteBtn extends StatelessWidget {
  // final MoviesModel moviesModel;
  const FavouriteBtn({
    super.key,
    //  required this.moviesModel
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(MyAppIcons.favoriteOutline));
  }
}
