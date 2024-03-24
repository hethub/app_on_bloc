abstract class SearchEvent {
  const SearchEvent();
}

class ONSearchEvent extends SearchEvent {
  final String query;
  const ONSearchEvent({required this.query});
}
