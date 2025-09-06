import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';

class FavouriteBtn extends StatelessWidget {
  const FavouriteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(MyAppIcons.favouriteRounded, color: Colors.red),
    );
  }
}
