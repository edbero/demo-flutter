import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_application_1/theme/routes.dart';
import 'package:flutter_application_1/views/auth/opening_view.dart';

void main() {
  // GraphQL
  final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  var app = GraphQLProvider(client: client, child: const MyApp());
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opening View Demo',
      routes: AppRoutes.define(),
      home: const Opening(),
    );
  }
}
