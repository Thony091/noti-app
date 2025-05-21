import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'package:noti_app/config/constants/Environment.dart';
import 'package:noti_app/features/news/domain/datasources/news_datasource.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/infrastructure/mappers/article_mapper.dart';
import 'package:noti_app/features/news/infrastructure/models/models_container.dart';

class NewsDatasourceImpl implements NewsDatasource {

  final dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      queryParameters: {
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
          'country': 'us',
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


  @override
  Future<List<Article>> fetchSportArticles() async {

    List<Article> articlesConverted = [];

    try {

      final response = await dio.get('/top-headlines',
        queryParameters: {
          'category': 'sports',
          'country': 'us',
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
  
  @override
  Future<List<Article>> searchNewsByQuery( String query ) async {
    List<Article> articles = [];

    try {

      final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final response = await dio.get('/everything',
        queryParameters: {
          'q': query,
          'from': today.toString(),
          'to': today.toString(),
          'sortBy': 'popularity',
        }
      );

      if (response.statusCode == 200) {
        final articlesModel = (response.data['articles'] as List)
          .map((json) => ArticleModel.fromJson(json))
          .toList();

        articles = articlesModel.map(
          (article) => ArticleMapper.articleModelToEntity(article)
        ).toList();
        
        return articles;
      } else{
        print('Error: ${response.statusCode}');
        return articles;
      }

    } on DioException catch (e) {
      // Si la respuesta incluye cuerpo, imprímelo
      if (e.response != null) {
        print('URL:  ${e.requestOptions.uri}');
        print('BODY: ${e.response!.data}');
      }
      rethrow;
      // return articles;
    }
  }



}