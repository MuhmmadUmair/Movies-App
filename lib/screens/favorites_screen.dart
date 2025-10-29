import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/view_models/favourites/favouite_bloc.dart';
import 'package:movie_app/widgets/my_error_widget.dart';

import '../constants/my_app_icons.dart';
import '../widgets/movies/movies_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<FavouiteBloc>().add(RemoveAllFromFavourites());
            },
            icon: const Icon(MyAppIcons.delete, color: Colors.red),
          ),
        ],
      ),
      body: BlocBuilder<FavouiteBloc, FavouiteState>(
        builder: (context, state) {
          if (state is FavouiteLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  SizedBox(height: 20),
                  CircularProgressIndicator.adaptive(),
                ],
              ),
            );
          } else if (state is FavouiteError) {
            return MyErrorWidget(
              errorText: state.message,
              retryFunction: () {
                getIt<FavouiteBloc>().add(LoadFavourites());
              },
            );
          } else if (state is FavouiteLoaded) {
            if (state.favourites.isEmpty) {
              return Center(
                child: Text(
                  'No added Favs',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.favourites.length,
              itemBuilder: (context, index) {
                final reversedList = state.favourites.reversed.toList();
                return MoviesWidget(movieModel: reversedList[index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
