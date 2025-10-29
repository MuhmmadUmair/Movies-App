import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/movies_screen.dart';
import 'package:movie_app/service/init_getit.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view_models/favourites/favouite_bloc.dart';
import 'package:movie_app/view_models/movies/movies_bloc.dart';

import '../widgets/my_error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = getIt<MoviesBloc>();
    final favoriteBloc = getIt<FavouiteBloc>();
    final navigationService = getIt<NavigationService>();
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<MoviesBloc, MoviesState>(
            bloc: moviesBloc..add(FetchMoviesEvent()),
            listener: (context, state) {
              if (state is MoivesLoadedState &&
                  favoriteBloc.state is FavouiteLoaded) {
                navigationService.navigateReplace(MoviesScreen());
              } else if (state is MoviesErrorState) {
                navigationService.showSnackbar(state.message);
              }
            },
          ),
          BlocListener<FavouiteBloc, FavouiteState>(
            bloc: favoriteBloc..add(LoadFavourites()),
            listener: (context, state) {
              if (state is FavouiteError) {
                navigationService.showSnackbar(state.message);
              }
            },
          ),
        ],
        child: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: moviesBloc..add(FetchMoviesEvent()),
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loading..."),
                    SizedBox(height: 20),
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              );
            } else if (state is MoviesErrorState) {
              return MyErrorWidget(
                errorText: state.message,
                retryFunction: () {
                  moviesBloc.add(FetchMoviesEvent());
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
