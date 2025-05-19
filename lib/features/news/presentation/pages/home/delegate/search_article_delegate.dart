import 'package:flutter/material.dart';
import 'package:noti_app/features/news/domain/domain_container.dart';
import 'package:noti_app/features/news/presentation/bloc/search/search_bloc.dart';

class SearchArticleDelegate extends SearchDelegate<Article?> {
  
  final SearchBloc searchBloc;
  DateTime _fechaDesde = DateTime.now();
  DateTime _fechaHasta = DateTime.now();

  SearchArticleDelegate(this.searchBloc);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaDesde,
      firstDate: _fechaDesde,
      lastDate: _fechaHasta,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Column(
        children: [
          IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear),
          ),
          // Row(
          //   children: [
          //     const Text('Desde'),
          //     Expanded(
          //       child: TextField(
          //         onChanged: (value) {
          //           from = value;
          //         },
          //         decoration: const InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: 'Desde',
          //         ),
          //       ),
          //     ),
          //     Text('Hasta'),
          //     Expanded(
          //       child: TextField(
          //         onChanged: (value) {
          //           to = value;
          //         },
          //         decoration: const InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: 'Hasta',
          //         ),
          //       ),
          //     ),
          //   ]
          // )
        ],
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}