import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/infrastructure/models/article_model.dart';

class ArticleMapper {
  static Article articleModelToEntity(ArticleModel modelDb) => Article(
    source: modelDb.source,
    author: modelDb.author ,
    title: modelDb.title ,
    description: modelDb.description,
    url: modelDb.url,
    urlToImage: modelDb.urlToImage ,
    publishedAt: modelDb.publishedAt,
    content: modelDb.content,
  );
}