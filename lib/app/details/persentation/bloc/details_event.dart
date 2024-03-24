abstract class DetailsEvent {
  final String id;
  const DetailsEvent(this.id);
}

class GetDetailsEvent extends DetailsEvent {
  const GetDetailsEvent(String id) : super(id);
}
