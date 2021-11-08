import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");
// final HttpLink httpLink = HttpLink("http://34.101.91.161/graphql");

class GraphQLService {
  final GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: httpLink,
  );

  Future<QueryResult> performQuery(String query,
      {required Map<String, dynamic> variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);
    final result = await _client.query(options);
    print(result);
    return result;
  }

  Future<QueryResult> performMutation(String query,
      {required Map<String, dynamic> variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables);
    final result = await _client.mutate(options);
    return result;
  }
}
