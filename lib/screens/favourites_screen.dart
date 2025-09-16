import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/view_model/favourites_provider.dart';
import 'package:movie_app/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Favourite Movies', textAlign: TextAlign.center),
        ),
        actions: [
          IconButton(
            onPressed: () {
              favouriteProvider.clearFavs();
            },
            icon: Icon(MyAppIcons.delete, color: Colors.red),
          ),
        ],
      ),
      body: favouriteProvider.favouritesList.isEmpty
          ? Center(child: Text("No Added Favorites"))
          : ListView.builder(
              itemCount: favouriteProvider.favouritesList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: favouriteProvider.favouritesList[index],
                  child: MoviesWidget(),
                );
              },
            ),
    );
  }
}
