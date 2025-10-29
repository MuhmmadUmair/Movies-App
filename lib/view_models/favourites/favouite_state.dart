part of 'favouite_bloc.dart';

sealed class FavouiteState extends Equatable {
  const FavouiteState();

  @override
  List<Object> get props => [];
}

final class FavouiteInitial extends FavouiteState {}

final class FavouiteLoading extends FavouiteState {}

final class FavouiteLoaded extends FavouiteState {
  final List<MovieModel> favourites;

  const FavouiteLoaded({required this.favourites});
  @override
  List<Object> get props => [favourites];
}

final class FavouiteError extends FavouiteState {
  final String message;

  const FavouiteError({required this.message});
  @override
  List<Object> get props => [message];
}
