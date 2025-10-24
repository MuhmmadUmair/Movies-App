import 'dart:convert';
import 'package:flutter/foundation.dart'; // for compute
import 'package:http/http.dart' as http;
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_genres.dart';
import 'package:movie_app/models/movies_model.dart';

class ApiService {
  Future<List<MoviesModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=$page",
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return compute(_parseMovies, response.body); // background isolate
    } else {
      throw Exception("Failed to load movies ${response.statusCode}");
    }
  }

  static List<MoviesModel> _parseMovies(String responseBody) {
    final data = jsonDecode(responseBody);
    return List.from(data['results'].map((e) => MoviesModel.fromJson(e)));
  }

  Future<List<MovieGenres>> movieGenres() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/genre/movie/list?language=en",
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return compute(_parseGenres, response.body); // background isolate
    } else {
      throw Exception("Failed to load genres ${response.statusCode}");
    }
  }

  static List<MovieGenres> _parseGenres(String responseBody) {
    final data = jsonDecode(responseBody);
    return List.from(data['genres'].map((e) => MovieGenres.formJson(e)));
  }
}
