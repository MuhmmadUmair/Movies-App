import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),
          IconButton(onPressed: () {}, icon: Icon(MyAppIcons.dark)),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return MoviesWidget();
        },
      ),
    );
  }
}
