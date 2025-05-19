import 'package:noti_app/features/news/domain/domain_container.dart';
import 'package:noti_app/features/news/infrastructure/infrastructure_container.dart';

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