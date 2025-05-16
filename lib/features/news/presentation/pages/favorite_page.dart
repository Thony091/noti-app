import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/presentation/container.dart';

import '../bloc/bloc_container.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return const Center(child: Text('No hay favoritos'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (_, index) {
                final article = state.favorites[index];
                return ArticleCardWidget(
                  article: article,
                  isFavPage: true,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
