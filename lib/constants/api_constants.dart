import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.get("MOVIES_API_KEY");
  static String bearerKey = dotenv.get("MOVIES_BEARERTOKEN");
  static String baseUrl = "https://api.themoviedb.org/3";
  static Map<String, String> get headers => {
    'Authorization': 'Bearer $bearerKey',
    'accept': 'application/json',
  };
}
