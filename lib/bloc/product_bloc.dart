import 'package:flutter_application_1/bloc/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/products.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  final Repository repository;
  ProductBloc({required this.repository}) : super(ProductStates());

  ProductInitialState get initialState => ProductInitialState();

  @override
  Stream<ProductStates> mapEventToState(
    ProductEvents event,
  ) async* {
    if (event is ProductEvents) {
      try {
        yield ProductLoadingState();
        final results = await repository.getAllProducts();

        yield ProductLoadedState(
          products: results,
        );
      } catch (error) {
        yield ProductErrorState();
      }
    }
  }
}
