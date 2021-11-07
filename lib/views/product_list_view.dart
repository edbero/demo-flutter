import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/product_bucket.dart';
import 'package:flutter_application_1/bloc/repository.dart';
import 'package:flutter_application_1/services/query/product_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Repository repository = Repository();

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
      body: BlocProvider(
        create: (context) => ProductBloc(
          repository: repository,
        )..add(ProductLoadEvent(test, const {})),
        child: BlocBuilder<ProductBloc, ProductStates>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoadedState) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                child: Column(
                  children: <Widget>[
                    title,
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.products.length,
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
                                      state.products[index].getName(),
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
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
