abstract class ProductEvent {}

class FetchProductEvent extends ProductEvent {}

//search bar;
class SearchProductEvent extends ProductEvent {
  final String query;

  SearchProductEvent(this.query);

  @override
  String toString() => 'SearchProductEvent { query: $query }';
}

class ClearProductEvent extends ProductEvent {}
