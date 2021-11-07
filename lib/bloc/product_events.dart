class ProductEvents {}

class ProductLoadEvent extends ProductEvents {
  final String query;
  final Map<String, dynamic> variables;

  ProductLoadEvent(this.query, this.variables);
}
