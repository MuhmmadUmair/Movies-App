import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Favourite Movies', textAlign: TextAlign.center),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(MyAppIcons.delete, color: Colors.red),
          ),
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
