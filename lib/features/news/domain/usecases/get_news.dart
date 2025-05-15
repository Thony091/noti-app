import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/domain/repositories/news_repository.dart';

class GetNews {
  
  final NewsRepository repository;
  GetNews(this.repository);

  Future<List<Article>> call() async {
    return await repository.getArticles();
  }

}