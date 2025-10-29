part of 'favouite_bloc.dart';

sealed class FavouiteEvent extends Equatable {
  const FavouiteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavourites extends FavouiteEvent {}

class AddToFavourites extends FavouiteEvent {
  final MovieModel movieModel;

  const AddToFavourites({required this.movieModel});
  @override
  List<Object> get props => [movieModel];
}

class RemoveFromFavourites extends FavouiteEvent {
  final MovieModel movieModel;

  const RemoveFromFavourites({required this.movieModel});
  @override
  List<Object> get props => [movieModel];
}

class RemoveAllFromFavourites extends FavouiteEvent {}
