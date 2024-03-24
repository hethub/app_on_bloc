import 'package:equatable/equatable.dart';
import '../../../domain/entities/search_history_entitiy.dart';

abstract class LocalHistoryState extends Equatable {
  final List<SearchHistoryEntitity>? searchHistoryEntitity;
  const LocalHistoryState({this.searchHistoryEntitity});
  @override
  List<Object> get props => [searchHistoryEntitity!];
}

class LocalHistoryLoading extends LocalHistoryState {
  const LocalHistoryLoading();
}

class LocalHistoryEmpty extends LocalHistoryState {
  const LocalHistoryEmpty();
}

class LocalHistoryNotFound extends LocalHistoryState {
  const LocalHistoryNotFound();
}

class LocalHistoryDone extends LocalHistoryState {
  const LocalHistoryDone(List<SearchHistoryEntitity> searchHistoryEntitity)
      : super(searchHistoryEntitity: searchHistoryEntitity);
}
