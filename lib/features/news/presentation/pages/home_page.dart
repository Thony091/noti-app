import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noti_app/features/news/domain/entities/article.dart';
import 'package:noti_app/features/news/presentation/bloc/bloc_container.dart';
import 'package:noti_app/features/news/presentation/container.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noticias')),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (_, index) {
                final article = state.articles[index];
                return ArticleTile(article: article);
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final Article article;
  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final isFav = context.select<FavoritesBloc, bool>(
      (bloc) => bloc.state.favorites.any((a) => a.url == article.url),
    );

    return ListTile(
      leading: article.urlToImage.isNotEmpty
          ? Image.network(
              article.urlToImage, 
              width: 100, 
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) 
                => NullImageWidget()
            )
          : NullImageWidget(),
      title: Text(article.title),
      subtitle: Text(article.description),
      trailing: IconButton(
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
        color: isFav ? Colors.red : null,
        onPressed: () {
          context.read<FavoritesBloc>().add(
            isFav ? RemoveFavorite(article) : AddFavorite(article),
          );
        },
      ),
      onTap: () {

      },
    );
  }
}

