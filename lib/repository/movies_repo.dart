import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/service/api_service.dart';
import '../models/movies_model.dart';

class MoviesRepository {
  final ApiService _apiService;
  MoviesRepository(this._apiService);

  Future<List<MoviesModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  // List<MoviesGenre> cachedGenres = [];
  Future<List<GenresList>> fetchGenres() async {
    // return cachedGenres = await _apiService.fetchGenres();
    return await _apiService.movieGenres();
  }
}
