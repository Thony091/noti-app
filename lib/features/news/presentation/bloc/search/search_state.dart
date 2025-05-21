part of 'search_bloc.dart';

abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  final List<Article> articles;
  SearchLoaded(this.articles);
  
  @override
  List<Object?> get props => [articles];
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
  
  @override
  List<Object?> get props => [message];
}

class SearchEmpty extends SearchState {
  @override
  List<Object?> get props => [];
}