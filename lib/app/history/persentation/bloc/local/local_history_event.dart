import 'package:equatable/equatable.dart';

import '../../../domain/entities/search_history_entitiy.dart';

abstract class LocalHistoryEvent extends Equatable {
  final SearchHistoryEntitity? searchHistoryEntitity;
  final String? query;
  const LocalHistoryEvent({this.searchHistoryEntitity, this.query});
  @override
  List<Object> get props => [searchHistoryEntitity!];
}

class GetLocalHistoryEvent extends LocalHistoryEvent {
  const GetLocalHistoryEvent({String? query}) : super(query: query);
}

class SaveLocalHistoryEvent extends LocalHistoryEvent {
  const SaveLocalHistoryEvent(
      {required SearchHistoryEntitity searchHistoryEntitity})
      : super(searchHistoryEntitity: searchHistoryEntitity);
}

class DeleteLocalHistoryEvent extends LocalHistoryEvent {
  final int id;
  const DeleteLocalHistoryEvent({required this.id, String? query})
      : super(query: query);
}
