import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noti_app/features/news/domain/domain_container.dart';
import 'package:noti_app/features/news/presentation/container.dart';

Future<dynamic> completeNewMethod({ required context, required Article article, bool isFavPage = false}) {

    final textTheme = Theme.of(context).textTheme;
    final size      = MediaQuery.of(context).size;

    return showDialog(
      context: context,
      builder: (context) { 
        final isFav = context.select<FavoritesBloc, bool>(
          (bloc) => bloc.state.favorites.any((a) => a.url == article.url),
        );
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          insetPadding: const EdgeInsets.all(10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.88,
              maxHeight: size.height * 0.85,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            article.title,
                            style: textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              article.urlToImage,
                              height: 200,
                              width: size.width * 0.88,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => 
                                NullImageWidget( isCompleteNew: true),
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Image.asset(
                                  'assets/loaders/bottle-loader.gif',
                                  width: size.width * 0.88,
                                  height: 200,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text( 
                            article.content, 
                            style: textTheme.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: size.width * 0.5,
                                ),
                                child: Text(
                                  article.author, 
                                  style: textTheme.titleMedium,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${article.publishedAt.toLocal()}'.split(' ')[0],
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !isFavPage
                          ? CustomIconButton(
                              icon: Icons.favorite,
                              size: 30,
                              color: isFav ? Colors.red : null,
                              onTap: () => context.read<FavoritesBloc>().add(
                                isFav 
                                  ? RemoveFavorite(article) 
                                  : AddFavorite(article)
                              )
                            )
                          : CustomIconButton(
                              icon: isFav 
                                ? Icons.delete 
                                : Icons.done_outline_outlined,
                              size: 30,
                              color: !isFav ? Colors.red : null,
                              onTap: isFav 
                                ? () => context.read<FavoritesBloc>().add(RemoveFavorite(article))
                                : () {},
                            ),

                        TextButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            size: 30,
                          ),
                          label: const Text('Cerrar'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red.withOpacity(.1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
