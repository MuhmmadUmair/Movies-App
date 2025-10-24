import 'package:movie_app/models/movies_model.dart';

class FavouriteState {
  final List<MoviesModel> favouriteList;
  FavouriteState({this.favouriteList = const []});

  FavouriteState copyWith({List<MoviesModel>? favouriteList}) {
    return FavouriteState(favouriteList: favouriteList ?? this.favouriteList);
  }
}
