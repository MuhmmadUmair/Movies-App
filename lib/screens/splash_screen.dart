import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movies/my_error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ],
              ),
            )
          : MyErrorWidget(errorText: "error message", retryFuction: () {}),
    );
  }
}
