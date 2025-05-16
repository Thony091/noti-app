import 'package:noti_app/features/news/domain/entities/article.dart';

abstract class NewsDatasource {
  Future<List<Article>> fetchArticles();
  Future<List<Article>> fetchSportArticles();
}
