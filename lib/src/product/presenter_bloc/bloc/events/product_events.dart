abstract class ProductEvent {}

class FetchProductEvent extends ProductEvent {}

//search bar;
class SearchProductEvent extends ProductEvent {
  final String query;

  SearchProductEvent(this.query);
  @override
  String toString() => 'Searching for... { query: $query }';
}

class ClearProductEvent extends ProductEvent {}
