import 'package:dartz/dartz.dart';

import 'package:noti_app/core/core_container.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getArticles();
  Future<Either<Failure, List<Article>>> getSportArticles();
  // Future<List<Article>> getSportArticles();
  Future<Either<Failure, List<Article>>> searchNewsByQuery(String query);
}