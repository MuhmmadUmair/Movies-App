import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/widgets/cached_image.dart';
import 'package:movie_app/widgets/movies/favourite_btn.dart';
import 'package:movie_app/widgets/movies/geners_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  final MoviesModel moviesModel;
  const MoviesWidget({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            getIt<NavigationService>().navigation(
              MovieDetails(moviesModel: moviesModel),
            );
          },
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: moviesModel.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedImage(
                      // ignore: unnecessary_null_comparison
                      imgUrl: moviesModel.posterPath != null
                          ? 'https://image.tmdb.org/t/p/w500${moviesModel.posterPath}'
                          : 'https://via.placeholder.com/500x750?text=No+Image',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        moviesModel.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(MyAppIcons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 5),
                          Text('${moviesModel.voteAverage}/10'),
                        ],
                      ),
                      SizedBox(height: 10),
                      GenersListWidget(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            MyAppIcons.watchLater,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(width: 5),
                          Text(
                            moviesModel.releaseDate,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          FavouriteBtn(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
