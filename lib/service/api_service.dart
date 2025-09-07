import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';

class ApiService {
  Future<List<MoviesModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1'",
    );
    final response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
      return List.from(
        data['results'].map((index) => MoviesModel.fromJson(index)),
      );
    } else {
      throw Exception("Failed to load movies ${response.statusCode}");
    }
  }

  Future<List<MovieGenres>> movieGenres() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/genre/movie/list?language=en'",
    );
    final response = await http.get(url, headers: ApiConstants.headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log("data $data");
      return List.from(
        data['genres'].map((index) => MoviesModel.fromJson(index)),
      );
    } else {
      throw Exception("Failed to load movies ${response.statusCode}");
    }
  }
}
