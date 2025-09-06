import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_constants.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/widgets/cached_image.dart';
import 'package:movie_app/widgets/movies/favourite_btn.dart';
import 'package:movie_app/widgets/movies/geners_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedImage(imgUrl: MyAppConstants.movieImage),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Movie Title",
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
                          Text('8/10'),
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
                            "Release Date",
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
