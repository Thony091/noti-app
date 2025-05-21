part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchArticles extends SearchEvent {
  final String query;


  SearchArticles( this.query);
}


