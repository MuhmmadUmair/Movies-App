import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesProvider with ChangeNotifier {
  final List<MoviesModel> _favouritesList = [];
  List<MoviesModel> get favouritesList => _favouritesList;

  final favskey = "favsKey";

  FavouritesProvider() {
    loadFavourites();
  }

  bool isFavourite(MoviesModel movieModel) {
    return _favouritesList.any((movie) => movie.id == movieModel.id);
  }

  void addOrRemoveFavourites(MoviesModel movieModel) {
    if (isFavourite(movieModel)) {
      _favouritesList.removeWhere((movie) => movie.id == movieModel.id);
    } else {
      _favouritesList.add(movieModel);
    }
    saveFavourite();
    notifyListeners();
  }

  Future<void> saveFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = _favouritesList
        .map((movie) => json.encode(movie.toJson()))
        .toList();
    prefs.setStringList(favskey, stringList);
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favskey) ?? [];
    _favouritesList.clear();
    _favouritesList.addAll(
      stringList.map((movie) => MoviesModel.fromJson(json.decode(movie))),
    );
    notifyListeners();
  }

  void clearFavs() {
    _favouritesList.clear();
    notifyListeners();
    saveFavourite();
  }
}
