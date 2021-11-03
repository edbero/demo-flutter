import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");

GraphQLClient clientToQuery() {
  return GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: httpLink,
  );
}
