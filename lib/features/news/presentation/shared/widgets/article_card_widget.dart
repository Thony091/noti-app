import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/presentation/container.dart';

class ArticleCardWidget extends StatelessWidget {

  final Article article;
  final bool isFavPage;

  const ArticleCardWidget({
    super.key,
    required this.article,
    this.isFavPage = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final isFav = context.select<FavoritesBloc, bool>(
      (bloc) => bloc.state.favorites.any((a) => a.url == article.url),
    );

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3)
            ),
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 200,
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    NullImageWidget(),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Image.asset(
                      'assets/loaders/bottle-loader.gif',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: textStyle.titleLarge?.copyWith(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        article.description,
                        style: textStyle.bodyMedium,
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: !isFavPage
                  ? CustomIconButton(
                      icon: Icons.favorite,
                      size: 30,
                      color: isFav ? Colors.red : null,
                      onTap: () => context.read<FavoritesBloc>().add(
                        isFav ? RemoveFavorite(article) : AddFavorite(article))
                    )
                  : CustomIconButton(
                      icon: Icons.delete,
                      size: 30,
                      onTap: () => context.read<FavoritesBloc>().add(RemoveFavorite(article))
                    )
              )
            ]
          ),
        ),
      ),
    );
  }
}