import 'package:noti_app/features/news/domain/entities/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getArticles();
}