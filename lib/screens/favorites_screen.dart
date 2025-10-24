import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/view_models/favourites/favourite_provider.dart';

import '../constants/my_app_icons.dart';
import '../widgets/movies/movies_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favouriteProvider.notifier).clearFavs();
            },
            icon: const Icon(MyAppIcons.delete, color: Colors.red),
          ),
        ],
      ),
      body: favoriteState.favouriteList.isEmpty
          ? Center(
              child: Text(
                'No added Favs',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoriteState.favouriteList.length,
              itemBuilder: (context, index) {
                return MoviesWidget(
                  movieModel: favoriteState.favouriteList[index],
                ); //const Text("data");
              },
            ),
    );
  }
}
