import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product.dart';
import 'package:flutter_application_1/services/query/product.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = <Product>[];
  final Queries _query = Queries();

  @override
  Widget build(BuildContext context) {
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
            document: gql(_query.fetchAllProducts()),
          ),
          builder: (QueryResult result, {refetch, fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // final productList = Product.getProduct(result.data?['products']['edges']);
            // setState(() {
            for (var i = 0; i < result.data?["products"].length; i++) {
              products.add(Product(
                id: result.data?["products"]['edges'][i]["node"]["id"],
                name: result.data?["products"]['edges'][i]["node"]["name"],
                price: "Rp 300.000",
              ));
            }
            // });

            return Column(
              children: <Widget>[
                title,
                Expanded(
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 24,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (_, index) {
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
                              // Image.network(product['thumbnail']['url']),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  products[index].getName(),
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
