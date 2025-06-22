import 'dart:ui';
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    final colortheme  = Theme.of(context).appBarTheme;
    final theme       = Theme.of(context).textTheme;
    final size        = MediaQuery.of(context).size;

    //* Variables para calcular el header
    double headerHeight = maxExtent - shrinkOffset;
    headerHeight = newNumberStateMethod(headerHeight, minExtentHeight);
    
    //* Variables para calcular el Opacity y Transform(scale)
    final minExpandedHeight = headerHeight - minExtent;
    final maxExpandedHeight = maxExtent - minExtent;
    double maxExpandedHeightPercent = minExpandedHeight / maxExpandedHeight;

    //* Un valor de 0.0 a 1.0 que representa qué tan colapsado está el header.
    // 0.0 = totalmente expandido (el usuario no ha hecho scroll)
    // 1.0 = totalmente colapsado (el header está en su tamaño mínimo)
    final double collapseRatio = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    //* ANIMACIÓN DEL TÍTULO: Alineación y Tamaño de Fuente
    final Alignment titleAlignment = Alignment.lerp(
      // ESTADO INICIAL (expandido): Centrado horizontalmente, y un poco hacia arriba verticalmente.
      // Esto deja espacio abajo para el buscador.
      const Alignment(0.0, -0.5), 
      // ESTADO FINAL (colapsado): Centrado verticalmente y a la izquierda.
      Alignment.centerLeft,
      // La interpolación se basa en qué tan colapsado está.
      collapseRatio,
    )!;

    //* Variable de animación del tamaño de la fuente.
    final double titleFontSize = lerpDouble(
      30, // Tamaño grande cuando está expandido
      20, // Tamaño más pequeño cuando está colapsado
      collapseRatio
    )!;
    //* Finanl de opcion 3

    return SizedBox.expand(
      child: Container(
        padding: EdgeInsets.only(
          top: statusBarHeight,
          left: 16,
          right: 16
        ),
        color: colortheme.backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: titleAlignment,
              child: Text(
                title,
                style: theme.headlineLarge?.copyWith(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold
                )
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
