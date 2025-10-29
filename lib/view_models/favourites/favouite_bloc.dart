import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favouite_event.dart';
part 'favouite_state.dart';

class FavouiteBloc extends Bloc<FavouiteEvent, FavouiteState> {
  FavouiteBloc() : super(FavouiteInitial()) {
    on<LoadFavourites>(_loadFavorites);
    on<AddToFavourites>(_addToFavorite);
    on<RemoveFromFavourites>(_removeFromFavorite);
    on<RemoveAllFromFavourites>(_clearAllFavs);
  }

  final String favskey = 'favsKey';

  Future<void> _saveFavourites(List<MovieModel> favoritesList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> stringList = favoritesList
        .map((movie) => json.encode(movie.toJson()))
        .toList();
    prefs.setStringList(favskey, stringList);
  }

  // bool _isFavorite(MovieModel movieModel) {
  //   if (state is FavouiteLoaded) {
  //     return (state as FavouiteLoaded).favourites.any(
  //       (movie) => movie.id == movieModel.id,
  //     );
  //   }
  //   return false;
  // }

  Future<void> _addToFavorite(
    AddToFavourites event,
    Emitter<FavouiteState> emit,
  ) async {
    if (state is FavouiteLoaded) {
      List<MovieModel> updatedFavrites = List.from(
        (state as FavouiteLoaded).favourites,
      )..add(event.movieModel);
      emit(FavouiteLoaded(favourites: updatedFavrites));
      await _saveFavourites(updatedFavrites);
    }
  }

  Future<void> _removeFromFavorite(
    RemoveFromFavourites event,
    Emitter<FavouiteState> emit,
  ) async {
    if (state is FavouiteLoaded) {
      List<MovieModel> updatedFavrites = (state as FavouiteLoaded).favourites
          .where((movie) => movie.id != event.movieModel.id)
          .toList();
      emit(FavouiteLoaded(favourites: updatedFavrites));
      await _saveFavourites(updatedFavrites);
    }
  }

  Future<void> _loadFavorites(
    FavouiteEvent event,
    Emitter<FavouiteState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favskey) ?? [];
    final favsList = stringList
        .map((movie) => MovieModel.fromJson(json.decode(movie)))
        .toList();
    emit(FavouiteLoaded(favourites: favsList));
  }

  void _clearAllFavs(FavouiteEvent event, Emitter<FavouiteState> emit) {
    emit(const FavouiteLoaded(favourites: []));
    _saveFavourites([]);
  }
}
