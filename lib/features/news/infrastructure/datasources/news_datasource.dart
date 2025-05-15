import 'package:dio/dio.dart';
import 'package:noti_app/config/constants/Environment.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/infrastructure/mappers/article_mapper.dart';
import 'package:noti_app/features/news/infrastructure/models/models_container.dart';

abstract class NewsDatasource {
  Future<List<Article>> fetchArticles();
}

class NewsDatasourceImpl implements NewsDatasource {

  final dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      queryParameters: {
        'country': 'us',
        'apiKey': Environment.newsApiKey,
      }
    )
  );

  
  @override
  Future<List<Article>> fetchArticles() async {

    List<Article> articlesConverted = [];

    try {

      final response = await dio.get('/top-headlines',
        queryParameters: {
          'category': 'business',
        }
      );

      if (response.statusCode == 200) {
        final articles = (response.data['articles'] as List)
          .map((json) => ArticleModel.fromJson(json))
          .toList();

        articlesConverted = articles.map(
          (article) => ArticleMapper.articleModelToEntity(article)
        ).toList();
        
        return articlesConverted;
      } else{
        print('Error: ${response.statusCode}');
        return articlesConverted;
      }

    } catch (e) {
      print('Error: $e');
      return articlesConverted;
    }

  }

}