import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Enums/theme_enum.dart';
import 'package:movie_app/view_models/movies/movies_provider.dart';
import '../constants/my_app_icons.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../view_models/theme_provider.dart';
import '../widgets/movies/movies_widget.dart';
import 'favorites_screen.dart';

class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    final movieState = ref.watch(movieProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigation(const FavoritesScreen());
            },
            icon: const Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),
          IconButton(
            onPressed: () async {
              await ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(
              themeState == ThemeEnum.dark ? MyAppIcons.dark : MyAppIcons.light,
            ),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (movieState.isLoading && movieState.moviesList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (movieState.fetchMoviesError.isNotEmpty) {
            return Center(child: Text(movieState.fetchMoviesError));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !movieState.isLoading &&
                  movieState.fetchMoviesError.isEmpty) {
                ref.read(movieProvider.notifier).getMovies();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: movieState.moviesList.length,
              itemBuilder: (context, index) {
                return MoviesWidget(movieModel: movieState.moviesList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
