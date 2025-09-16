import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_constants.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/widgets/cached_image.dart';
import 'package:movie_app/widgets/movies/favourite_btn.dart';
import 'package:movie_app/widgets/movies/geners_list_widget.dart';
import 'package:provider/provider.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final movieModelProvider = Provider.of<MoviesModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            getIt<NavigationService>().navigation(
              ChangeNotifierProvider.value(
                value: movieModelProvider,
                child: MovieDetails(),
              ),
            );
          },
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: movieModelProvider.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedImage(
                      // ignore: unnecessary_null_comparison
                      imgUrl: movieModelProvider.posterPath != null
                          ? 'https://image.tmdb.org/t/p/w500${movieModelProvider.posterPath}'
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
                        movieModelProvider.title,
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
                          Text(
                            '${movieModelProvider.voteAverage.toStringAsFixed(1)}/10',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      GenersListWidget(moviesModel: movieModelProvider),
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
                            movieModelProvider.releaseDate,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          FavouriteBtn(moviesModel: movieModelProvider),
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
