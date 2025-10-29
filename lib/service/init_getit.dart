import 'package:get_it/get_it.dart';
import 'package:movie_app/service/navigation_service.dart';
import 'package:movie_app/view_models/favourites/favouite_bloc.dart';
import 'package:movie_app/view_models/movies/movies_bloc.dart';
import 'package:movie_app/view_models/theme/theme_bloc.dart';

import '../repository/movies_repo.dart';
import 'api_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  getIt.registerLazySingleton<MoviesBloc>(() => MoviesBloc());
  getIt.registerLazySingleton<FavouiteBloc>(() => FavouiteBloc());
}
