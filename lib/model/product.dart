import 'package:objectbox/objectbox.dart';

@Entity()
class Product {
  int id;
  int price;
  String name;

  Product({
    this.id = 0,
    required this.price,
    required this.name,
  });

  getId() => id;
  getName() => name;
  getPrice() => price;
}
