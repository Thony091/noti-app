import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (_, index) {
              final article = state.favorites[index];
              return ListTile(
                leading: article.urlToImage.isNotEmpty
                    ? Image.network(article.urlToImage, width: 100, fit: BoxFit.cover)
                    : null,
                title: Text(article.title),
                subtitle: Text(article.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<FavoritesBloc>().add(RemoveFavorite(article));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
