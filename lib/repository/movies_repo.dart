import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/service/api_service.dart';

class MoviesRepository {
  final ApiService _apiService;

  MoviesRepository(this._apiService);

  Future<List<MoviesModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  List<MovieGenres> cachedGenres = [];
  Future<List<MovieGenres>> movieGenres() async {
    return cachedGenres = await _apiService.movieGenres();
  }
}
