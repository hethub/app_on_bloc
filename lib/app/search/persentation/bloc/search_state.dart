import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/search_entities.dart';

abstract class SearchState extends Equatable {
  final List<SearchEntities>? result;
  final DioException? error;

  const SearchState({this.result, this.error});

  @override
  List<Object> get props => [result!, error!];
}

class Loading extends SearchState {
  const Loading();
}

class Done extends SearchState {
  const Done(List<SearchEntities> result) : super(result: result);
}

class Error extends SearchState {
  const Error(DioException error) : super(error: error);
}

class Empty extends SearchState {
  const Empty();
}

class NotFound extends SearchState {
  const NotFound();
}
