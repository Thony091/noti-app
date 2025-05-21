import 'package:noti_app/features/news/domain/entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getArticles();
  Future<List<Article>> getSportArticles();
  Future<List<Article>> searchNewsByQuery( String query );
  // Future<Either<Failure, List<Article>>> searchNewsByQuery(String query);
}