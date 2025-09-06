import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/screens/movies_screen.dart';
import 'package:movie_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: MyThemeData.lightTheme,
      home: SplashScreen(),
    );
  }
}
