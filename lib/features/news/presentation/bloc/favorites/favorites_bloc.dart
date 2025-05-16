import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:noti_app/features/news/infrastructure/mappers/article_mapper.dart';
import 'package:noti_app/features/news/infrastructure/models/article_model.dart';
import '../../../domain/entities/article.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final Box<ArticleModel> favoritesBox;

  FavoritesBloc( this.favoritesBox) : super( 
    FavoritesState( 
        favoritesBox.values
          .map( (a) => ArticleMapper.articleModelToEntity(a) )
          .toList()
      )
  ) {
  
    on<AddFavorite>((event, emit) {
      final updated = List<Article>.from(state.favorites)
        ..add(event.article);
      final articleModel = ArticleMapper.articleEntityToModel(event.article);
      favoritesBox.put(event.article.url, articleModel);
      emit(FavoritesState(updated));
    });

    on<RemoveFavorite>((event, emit) {
      final updated = List<Article>.from(state.favorites)
        ..removeWhere((a) => a.url == event.article.url);
      favoritesBox.delete(event.article.url);
      emit(FavoritesState(updated));
    });
    
    //* Por si se necesita implementar a futuro
    on<LoadFavorites>((event, emit) async {
      emit(FavoritesState(favoritesBox.values.map( (a) => ArticleMapper.articleModelToEntity(a) ).toList()));
    });

  }
}