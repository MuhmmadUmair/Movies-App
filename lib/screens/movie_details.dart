import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_app_constants.dart';
import 'package:movie_app/constants/my_app_icons.dart';
import 'package:movie_app/widgets/movies/favourite_btn.dart';
import 'package:movie_app/widgets/movies/geners_list_widget.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.65,
              width: double.infinity,
              child: CachedNetworkImage(imageUrl: MyAppConstants.movieImage),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.4),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25),
                              Text(
                                "Movie Title",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    MyAppIcons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text('9/10'),
                                  Spacer(),
                                  Text("Release Date"),
                                ],
                              ),
                              SizedBox(height: 10),
                              GenersListWidget(),
                              SizedBox(height: 15),
                              Text(
                                "Overview " * 200,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.center,
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
            ),
          ],
        ),
      ),
    );
  }
}
