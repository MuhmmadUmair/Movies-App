import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_constants.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/widgets/movies/favourite_btn.dart';
import 'package:movie_app/widgets/movies/geners_list_widget.dart';

class MovieDetails extends StatelessWidget {
  final MoviesModel moviesModel;
  const MovieDetails({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Hero(
                tag: moviesModel.id,
                child: SizedBox(
                  height: size.height * 0.65,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: moviesModel.posterPath != null
                        ? 'https://image.tmdb.org/t/p/w500${moviesModel.posterPath}'
                        : 'https://via.placeholder.com/500x750?text=No+Image',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.56),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  moviesModel.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      MyAppIcons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text('${moviesModel.voteAverage}/10'),
                                    Spacer(),
                                    Text(moviesModel.releaseDate),
                                  ],
                                ),
                                SizedBox(height: 10),
                                GenersListWidget(),
                                SizedBox(height: 15),
                                Text(
                                  moviesModel.overview,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FavouriteBtn(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
