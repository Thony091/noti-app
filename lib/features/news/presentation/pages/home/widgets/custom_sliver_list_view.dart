import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:noti_app/features/news/domain/domain_container.dart';
import 'package:noti_app/features/news/presentation/container.dart';

class CustomSliverListView extends StatelessWidget {

  final List<Article> articles;

  const CustomSliverListView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final article = articles[index];
          return Padding(
            padding: const EdgeInsets.symmetric( horizontal: 5),
            child: GestureDetector(
              child: FadeInUp(
                child: ArticleCardWidget(
                  article: article
                )
              ),
              onTap: () {
                completeNewMethod(context: context, article: article);
              }
            ),
          );
        },
        childCount: articles.length,
      )
    );
  }
}