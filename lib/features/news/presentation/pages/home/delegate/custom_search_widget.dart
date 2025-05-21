
import 'package:flutter/material.dart';
import 'package:noti_app/features/news/presentation/container.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    required this.maxExpandedHeightPercent,
    required this.size,
    required this.controller,
    required this.onSearch,
  });

  final double maxExpandedHeightPercent;
  final Size size;
  final TextEditingController controller;
  final void Function(String query) onSearch;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Transform.scale(
        scale: maxExpandedHeightPercent,
        child: Opacity(
          opacity: maxExpandedHeightPercent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
                width: size.width * 0.5,
                child: CustomTextField(
                  label: 'Buscar', 
                  hint: 'Buscar noticias',
                  controller: controller,
                ),
              ),
              SizedBox( width: 25,) ,
              SizedBox(
                width: size.width * 0.13,
                child: IconButton(
                  onPressed: controller.value.text.trim().isEmpty  
                    ? null
                    : () {
                      final query = controller.value.text;
                      onSearch(query);
                    },
                  icon: const Icon(Icons.search_rounded),
                  iconSize: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: size.width * 0.13,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  iconSize: 35,
                  color: Colors.white,
                  onPressed: () {
                    controller.clear();
                    onSearch('');
                    FocusScope.of(context).unfocus();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

