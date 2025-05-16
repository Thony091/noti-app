import 'package:noti_app/features/news/domain/datasources/news_datasource.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/domain/repositories/news_repository.dart';
import 'package:noti_app/features/news/infrastructure/datasources/news_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {

  final NewsDatasource datasource;

  NewsRepositoryImpl({
    NewsDatasource? datasource
  }): datasource = datasource ?? NewsDatasourceImpl();
  
  @override
  Future<List<Article>> getArticles() async {
    return await datasource.fetchArticles();
  }

  @override
  Future<List<Article>> getSportArticles() async {
    return await datasource.fetchSportArticles();
  }

}