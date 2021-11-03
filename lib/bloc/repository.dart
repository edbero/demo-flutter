import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/services/config.dart';
import 'package:flutter_application_1/services/query/product_query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {
  final GraphQLClient _client = clientToQuery();

  Future<List<Product>> getAllProducts() async {
    QueryResult result = await _client.query(QueryOptions(
      document: gql(getAllProductsQuery),
    ));

    if (result.hasException) {
      return [];
    } else {
      List data = result.data!["products"]["edges"];
      List<Product> products = [];
      for (var e in data) {
        products.add(Product(
          id: e['node']['id'],
          name: e['node']['name'],
          price: '100000',
        ));
      }

      return products;
    }
  }
}
