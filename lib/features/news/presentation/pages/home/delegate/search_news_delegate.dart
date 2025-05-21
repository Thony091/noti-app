
import 'package:flutter/material.dart';

import 'package:noti_app/features/news/presentation/pages/home/delegate/calculate_methods.dart';
import 'package:noti_app/features/news/presentation/pages/home/delegate/custom_search_widget.dart';

class SearchNewsDelegate extends SliverPersistentHeaderDelegate{

  final String title;
  final double statusBarHeight;
  final double maxExtentHeight;
  double minExtentHeight;
  final double appBarSize = 60;
  final TextEditingController searchController;
  final void Function(String query) onSearch;

  SearchNewsDelegate({
    required this.title,
    required this.statusBarHeight,
    required this.maxExtentHeight,
    this.minExtentHeight = 0,
    required this.searchController,
    required this.onSearch,
  }){
    minExtentHeight = statusBarHeight + 30;
  }

  @override
  Widget build(BuildContext context, double offset, bool overlapsContent) {

    final colortheme  = Theme.of(context).appBarTheme;
    final theme       = Theme.of(context).textTheme;
    final size        = MediaQuery.of(context).size;

    //* Variables para calcular el header
    double headerHeight = maxExtent - offset;
    headerHeight = newNumberStateMethod(headerHeight, minExtentHeight);
    
    //* Variables para calcular el Opacity y Transform(scale)
    final minExpandedHeight = headerHeight - minExtent;
    final maxExpandedHeight = maxExtent - minExtent;
    double maxExpandedHeightPercent = minExpandedHeight / maxExpandedHeight;

    //* Variables para calcular el Offset de title
    final textWidth = getTextWidth(context, title, theme.headlineLarge!);
    final centerX = (size.width - textWidth) / 2;
    final leftX = 10.0;
    final titleOffsetX = (1 - maxExpandedHeightPercent) * (centerX - leftX);

    return SizedBox.expand(
      child: Container(
        padding: EdgeInsets.only(
          top: statusBarHeight,
        ),
        color: colortheme.backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(-titleOffsetX, -10),
              child: Text(
                title,
                style: theme.headlineLarge
              ),
            ),
            if (maxExpandedHeightPercent > 0.3)
              CustomSearchWidget(
                maxExpandedHeightPercent: maxExpandedHeightPercent, 
                size: size, 
                controller: searchController, 
                onSearch: onSearch
              )
          ]
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxExtentHeight;

  @override
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
