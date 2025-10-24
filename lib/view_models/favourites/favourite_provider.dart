import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view_models/favourites/favourite_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteProvider, FavouriteState>(
      (_) => FavouriteProvider(),
    );

class FavouriteProvider extends StateNotifier<FavouriteState> {
  FavouriteProvider() : super(FavouriteState());
  final favskey = "favsKey";

  bool isFavourite(MoviesModel movieModel) {
    return state.favouriteList.any((movie) => movie.id == movieModel.id);
  }

  void addOrRemoveFavourites(MoviesModel movieModel) async {
    bool wasFavorite = isFavourite(movieModel);
    List<MoviesModel> updatedFavorite = wasFavorite
        ? state.favouriteList
              .where((element) => element.id != movieModel.id)
              .toList()
        : [...state.favouriteList, movieModel];

    state = state.copyWith(favouriteList: updatedFavorite);
    // if (isFavourite(movieModel)) {
    //   state.favouriteList.removeWhere((movie) => movie.id == movieModel.id);
    // } else {
    //   state.favouriteList.add(movieModel);
    // }
    await saveFavourite();
  }

  Future<void> saveFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = state.favouriteList
        .map((movie) => json.encode(movie.toJson()))
        .toList();
    prefs.setStringList(favskey, stringList);
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favskey) ?? [];

    final movies = stringList
        .map((movie) => MoviesModel.fromJson(json.decode(movie)))
        .toList();

    state = state.copyWith(favouriteList: movies);
  }

  void clearFavs() {
    state = state.copyWith(favouriteList: []);
    saveFavourite();
  }
}
