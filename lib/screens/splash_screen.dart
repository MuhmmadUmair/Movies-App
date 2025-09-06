import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movies/my_error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyErrorWidget(errorText: "errorText", retryFuction: () {}),
    );
  }
}
