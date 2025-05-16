import 'package:hive/hive.dart';
import 'package:noti_app/features/news/infrastructure/models/models_container.dart';

part 'article_model.g.dart';

@HiveType(typeId: 1)
class ArticleModel {
  @HiveField(0)
  SourceModel source;

  @HiveField(1)
  String author;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  String url;

  @HiveField(5)
  String urlToImage;

  @HiveField(6)
  DateTime publishedAt;

  @HiveField(7)
  String content;

  ArticleModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    source: SourceModel.fromJson(json["source"]),
    author: json["author"] ?? 'Sin autor',
    title: json["title"] ?? 'Sin titulo',
    description: json["description"] ?? 'Sin descripcion',
    url: json["url"] ?? 'Sin url',
    urlToImage: json["urlToImage"] ?? '',
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] ?? 'Sin contenido',
  );
  
  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };

}

