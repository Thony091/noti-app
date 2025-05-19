
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/domain/domain_container.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final NewsRepository newsRepository;

  SearchBloc(this.newsRepository) : super(SearchInitial()) {
    on<SearchArticles> ((event, emit) async {
      emit(SearchLoading());
      try {
        final articles = await newsRepository.searchNewsByQuery( event.query, event.from, event.to );
        emit(SearchLoaded(articles));
      } catch (e) {
        emit(SearchError('->Error en la Busqueda: $e')); 
      }
    });
  }
}