import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

ValueNotifier<GraphQLClient> clientGQL({required String uri}) {
  HttpLink httpLink = HttpLink(uri);

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
      // cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
}

// Wraps the root application with the `graphql_flutter` client.
// Use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({
    Key? key,
    required this.child,
    required String uri,
  })  : client = clientGQL(uri: uri),
        super(key: key);

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
