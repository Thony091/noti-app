import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/core/core_container.dart';
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
      final articles = await newsRepository.getArticles();
      final sportArticles = await newsRepository.getSportArticles();
      if ( articles.isRight() && sportArticles.isRight() ) {
        final articles1 = articles.getOrElse(() => []); 
        final articles2 = sportArticles.getOrElse(() => []);
        final allArticles = [...articles1, ...articles2];
        if ( allArticles.isEmpty ) {
          emit(NewsEmpty());
        } else {
          emit(NewsLoaded(allArticles));
        }
      } else if ( articles.isLeft() ) {
        final failure = articles.fold(
          (failure) => failure,
          (_) => ServerFailure("Hola, que hace?"),
        );
        emit(NewsError(failure.message));
      } else if ( sportArticles.isLeft() ) {
        final failure = sportArticles.fold(
          (failure) => failure,
          (_) => ServerFailure("Hola, que hace?"),
        );
        emit(NewsError(failure.message));
      }

    });

    add(FetchNews());
  }
}