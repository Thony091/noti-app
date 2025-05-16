part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object?> get props => [];
}

class AddFavorite extends FavoritesEvent {
  final Article article;
  const AddFavorite(this.article);

  @override
  List<Object?> get props => [article];
}

class RemoveFavorite extends FavoritesEvent {
  final Article article;
  const RemoveFavorite(this.article);

  @override
  List<Object?> get props => [article];
}

class LoadFavorites extends FavoritesEvent {
  const LoadFavorites();

  @override
  List<Object?> get props => [];
}