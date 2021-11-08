import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/services/config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {
  final GraphQLService _client = GraphQLService();

  Future<List<Product>> getAllProducts(query, variables) async {
    QueryResult result =
        await _client.performMutation(query, variables: variables);

    if (result.hasException) {
      return [];
    } else {
      print("resultt");
      print(result.data);
      List data = result.data!["products"]["edges"];
      List<Product> products = [];
      for (var e in data) {
        products.add(Product(
          id: e['node']['id'],
          name: e['node']['name'],
          price: 10000,
        ));
      }

      return products;
    }
  }
}
