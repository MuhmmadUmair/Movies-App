import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:movie_app/screens/favourites_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view_model/movies_provider.dart';
import 'package:movie_app/view_model/theme_provider.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';
import 'package:movie_app/widgets/my_error_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MoviesProvider>().getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Consumer(
        builder: (context, MoviesProvider moviesProvider, child) {
          if (moviesProvider.isLoading && moviesProvider.moviesList.isEmpty) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (moviesProvider.fetchMoviesError.isNotEmpty) {
            return MyErrorWidget(
              errorText: moviesProvider.fetchMoviesError,
              retryFunction: () => moviesProvider.getMovies(),
            );
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !moviesProvider.isLoading) {
                moviesProvider.getMovies();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: moviesProvider.moviesList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: moviesProvider.moviesList[index],
                  child: MoviesWidget(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
