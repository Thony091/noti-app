import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/domain/repositories/news_repository.dart';
import 'package:noti_app/features/news/infrastructure/datasources/news_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {

  final NewsDatasource datasource;
  NewsRepositoryImpl(this.datasource);
  
  @override
  Future<List<Article>> getArticles() async {
    return await datasource.fetchArticles();
  }

}