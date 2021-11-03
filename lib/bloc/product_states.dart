import 'package:flutter_application_1/model/product.dart';

class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductLoadedState extends ProductStates {
  final List<Product> products;
  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductStates {}
