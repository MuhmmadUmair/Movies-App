import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/service/init_getit.dart';

class MoviesProvider with ChangeNotifier {
  int _currentPage = 1;
  final List<MoviesModel> _moviesList = [];
  List<MoviesModel> get moviesList => _moviesList;

  List<GenresList> _genresList = [];
  List<GenresList> get genresList => _genresList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _fetchMoviesError = '';
  String get fetchMoviesError => _fetchMoviesError;
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

  Future<void> getMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (_genresList.isEmpty) {
        _genresList = await _moviesRepository.fetchGenres();
      }
      List<MoviesModel> movies = await _moviesRepository.fetchMovies(
        page: _currentPage,
      );
      _moviesList.addAll(movies);
      _currentPage++;
      _fetchMoviesError = "";
    } catch (error) {
      log("An error occured in fetch movies $error");
      _fetchMoviesError = error.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
