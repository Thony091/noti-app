import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noti_app/features/news/presentation/container.dart';
import 'package:noti_app/features/news/presentation/pages/home/delegate/search_news_delegate.dart';
import 'package:noti_app/features/news/presentation/pages/home/widgets/my_bloc_builder_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNews());
  }

  @override
  Widget build(BuildContext context) {

    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SearchNewsDelegate(
              title: 'Noticias',
              statusBarHeight: statusBarHeight,
              maxExtentHeight: statusBarHeight * 4,
              searchController: _searchController,
              onSearch: (query) {
                context.read<SearchBloc>().add(SearchArticles( query ));
              },
            ),
          ),
          MyBlocBuilderListWidget(),
        ],
      ),
    );
  }
}
