
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/domain/domain_container.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final NewsRepository newsRepository;

  SearchBloc(this.newsRepository) : super(SearchInitial()) {
    on<SearchArticles> ((event, emit) async {
      final query = event.query.trim();
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());
      try {
        final articles = await newsRepository.searchNewsByQuery( event.query );
        if (articles.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchLoaded(articles));
        }
      } catch (e) {
        emit(SearchError('->Error en la Busqueda: $e')); 
      }
    });
  }
}