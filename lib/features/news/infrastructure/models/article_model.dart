import 'package:noti_app/features/news/domain/entities/article.dart';

class ArticleModel {
    final Source source;
    final String author;
    final String title;
    final String description;
    final String url;
    final String urlToImage;
    final DateTime publishedAt;
    final String content;

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
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'Sin autor',
        title: json["title"] ?? 'Sin titulo',
        description: json["description"] ?? 'Sin descripcion',
        url: json["url"] ?? 'Sin url',
        urlToImage: json["urlToImage"] ?? 'https://thumb.ac-illust.com/b1/b170870007dfa419295d949814474ab2_w.jpeg',
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

