import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:movie_app/screens/favourites_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view_model/theme_provider.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigation(FavouritesScreen());
            },
            icon: Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),
          Consumer(
            builder: (context, ThemeProvider themeProvider, child) {
              return IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.themeData == MyThemeData.darkTheme
                      ? MyAppIcons.light
                      : MyAppIcons.dark,
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MoviesWidget();
        },
      ),
    );
  }
}
