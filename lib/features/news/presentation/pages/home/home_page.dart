import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noti_app/features/news/presentation/container.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch<Article?>(
              //   context: context, 
              //   delegate: SearchArticleDelegate()
              // );
            },
            icon: Container(
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (_, index) {
                  final article = state.articles[index];
                  return GestureDetector(
                    child: FadeInUp(
                      child: ArticleCardWidget(
                        article: article
                      )
                    ),
                    onTap: () {
                      completeNewMethod(context: context, article: article);
                    }
                  );
                },
              ),
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