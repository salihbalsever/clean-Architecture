import '../../data/models/product_model.dart';

sealed class ProductsState {
  const ProductsState();
}


class ProductsStateLoading extends ProductsState {
  const ProductsStateLoading({this.progress = 0});


  final double progress;
}


class ProductsStateError extends ProductsState {
  const ProductsStateError({required this.error});


  final String error;
}


class ProductsStateSuccess extends ProductsState {
  const ProductsStateSuccess({required this.products});


  final List<Product> products;
}
