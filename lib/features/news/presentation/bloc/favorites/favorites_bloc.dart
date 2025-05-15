import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/article.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState([])) {
    on<AddFavorite>((event, emit) {
      final updated = List<Article>.from(state.favorites)..add(event.article);
      emit(FavoritesState(updated));
    });

    on<RemoveFavorite>((event, emit) {
      final updated = List<Article>.from(state.favorites)
        ..removeWhere((a) => a.url == event.article.url);
      emit(FavoritesState(updated));
    });
  }
}