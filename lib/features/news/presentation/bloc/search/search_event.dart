part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchArticles extends SearchEvent {
  final String query;
  final String from;
  final String to;

  SearchArticles( this.query, this.from, this.to );
}


