import 'package:diwithriverpood/data/repositories/product_repository.dart';
import 'package:diwithriverpood/presentation/provider/product_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier() : super(const ProductsStateLoading());

  ProductDataSourceRepository productDataSourceRepository =
      ProductDataSourceRepository();

  List<Product> products = [];

  Future<List<Product>> getProducts() async {
    try {
      products = await productDataSourceRepository.getProducts("products");
      state = ProductsStateSuccess(products: products);
      return products;
    } on Exception{
        state = const ProductsStateError(error: 'Hatalı');
        rethrow;
    }
    }

}

final productsNotifier = StateNotifierProvider<ProductsNotifier, ProductsState>(
    (ref) => ProductsNotifier()..getProducts());
