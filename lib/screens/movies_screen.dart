import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/screens/favourites_screen.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigation(FavouritesScreen());
            },
            icon: Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              // final List<MoviesModel> movies = await getIt<ApiService>()
              //     .fetchMovies();
              // log("movies $movies");
              final List<MovieGenres> genres = await getIt<MoviesRepository>()
                  .movieGenres();
              // await getIt<ApiService>().movieGenres();
              log("genres $genres");
            },
            icon: Icon(MyAppIcons.dark),
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
