part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final List<Article> favorites;
  const FavoritesState(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
