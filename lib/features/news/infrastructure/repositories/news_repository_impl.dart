import 'package:dartz/dartz.dart';
import 'package:noti_app/core/core_container.dart';
import 'package:noti_app/features/news/domain/domain_container.dart';
import 'package:noti_app/features/news/infrastructure/infrastructure_container.dart';

class NewsRepositoryImpl implements NewsRepository {

  final NewsDatasource datasource;

  NewsRepositoryImpl({
    NewsDatasource? datasource
  }): datasource = datasource ?? NewsDatasourceImpl();
  
  @override
  Future<Either<Failure,List<Article>>> getArticles() async {
    try {
      final articles = await datasource.fetchArticles();
      return Right(articles);
    } on Exception catch (e) {
      return Left(ErrorMapper.map(e));
    }
    // return await datasource.fetchArticles();
  }

  @override
  Future<Either<Failure,List<Article>>> getSportArticles() async {
    try {
      final articles = await datasource.fetchSportArticles();
      return Right(articles);
    } on Exception catch (e) {
      return Left(ErrorMapper.map(e));
    }
    // return await datasource.fetchSportArticles();
  }

  @override
  Future<Either<Failure, List<Article>>> searchNewsByQuery(String query) async {
    try {
      final articles = await datasource.searchNewsByQuery(query);
      return Right(articles);
    } on Exception catch (e) {
      return Left(ErrorMapper.map(e));
    }
  }
}