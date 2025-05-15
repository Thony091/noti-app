import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/domain/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final NewsRepository newsRepository;

  NewsBloc(
    this.newsRepository
  ) : super( NewsInitial() ) {

    on<FetchNews>((event, emit) async {

      emit(NewsLoading());
      try {
        final articles = await newsRepository.getArticles();
        emit(NewsLoaded(articles));
      } catch (e) {
        emit(NewsError("Error al obtener noticias: ${e.toString()}"));
      }
    });

    add(FetchNews());
  }
}