
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_app/features/news/presentation/container.dart';

class MyBlocBuilderListWidget extends StatelessWidget {

  const MyBlocBuilderListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return SliverFillRemaining(
            child: const Center( child: CircularProgressIndicator() )
          );
        } else if (state is SearchLoaded) {
          return CustomSliverListView( articles: state.articles );
        } else if (state is SearchError) {
          return SliverFillRemaining(
            child: Center( child: Text(state.message) )
          );
        } else if ( state is SearchEmpty ) {
          return SliverFillRemaining(
            child: Center( child: Text('No se encontraron resultados') )
          );
        } else {
          return BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return SliverFillRemaining(
                  child: const Center(
                    child: CircularProgressIndicator()
                  )
                );
              } else if (state is NewsLoaded) {
                return CustomSliverListView( articles: state.articles );
              } else if (state is NewsError) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(state.message)
                  )
                );
              } else {
                return SliverToBoxAdapter(
                  child: const SizedBox.shrink()
                );
              }
            },
          );
        }
      }
    );
  }
}

