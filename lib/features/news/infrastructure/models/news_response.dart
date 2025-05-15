import 'dart:convert';

import 'package:noti_app/features/news/infrastructure/models/article_model.dart';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;
  
  NewsResponse({
      required this.status,
      required this.totalResults,
      required this.articles,
  });
  
  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
  );
  
  Map<String, dynamic> toJson() => {
      "status": status,
      "totalResults": totalResults,
      "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}