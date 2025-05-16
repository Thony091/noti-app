import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/presentation/bloc/bloc_container.dart';
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
    final size = MediaQuery.of(context).size;
    final isFav = context.select<FavoritesBloc, bool>(
      (bloc) => bloc.state.favorites.any((a) => a.url == article.url),
    );

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: 200,
        width: size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5,
              offset: Offset(0, 3)
            ),
          ]
        ),
        child: Row(
          children: [
            Image.network(
              height: 200,
              width: size.width * 0.25,
              article.urlToImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => 
                NullImageWidget(),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Image.asset(
                  'assets/loaders/bottle-loader.gif',
                  width: size.width * 0.25,
                  height: 100,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: size.width * 0.55,
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 5
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: textStyle.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      article.description,
                      style: textStyle.bodyMedium,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
              
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.15,
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
    );
  }
}