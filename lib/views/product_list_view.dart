import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String productsGraphQL = """
query products {
  products(first: 10, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        thumbnail {
          url
        }
      }
    }
  }
}
""";

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final title = Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Text(
        "Products",
        style: Theme.of(context).textTheme.headline5,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
        child: Query(
          options: QueryOptions(
            document: gql(productsGraphQL),
          ),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final productList = result.data?['products']['edges'];
            return Column(
              children: <Widget>[
                title,
                Expanded(
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (_, index) {
                      var product = productList[index]['node'];
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 180,
                          height: 180,
                          child: Column(
                            children: [
                              Image.network(product['thumbnail']['url']),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  product['name'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Text("Rp. 300.000"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
