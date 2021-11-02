class Product {
  final String id;
  final String name;
  final String price;

  Product({required this.id, required this.name, required this.price});

  getId() => id;
  getName() => name;
  getPrice() => price;
}
