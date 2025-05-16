import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/infrastructure/mappers/source_mapper.dart';
import 'package:noti_app/features/news/infrastructure/models/article_model.dart';

class ArticleMapper {
  static Article articleModelToEntity(ArticleModel modelDb) => Article(
    source: SourceMapper.fromModel( modelDb.source) , 
    author: modelDb.author,
    title: modelDb.title,
    description: modelDb.description,
    url: modelDb.url,
    urlToImage: modelDb.urlToImage,
    publishedAt: modelDb.publishedAt,
    content: modelDb.content,
  );

  static ArticleModel articleEntityToModel(Article entity) => ArticleModel(
    source: SourceMapper.toModel( entity.source),
    author: entity.author,
    title: entity.title,
    description: entity.description,
    url: entity.url,
    urlToImage: entity.urlToImage,
    publishedAt: entity.publishedAt,
    content: entity.content,
  );
}