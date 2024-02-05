import 'package:diwithriverpood/data/repositories/product_repository.dart';
import 'package:diwithriverpood/presentation/provider/product_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';

class ProductProvider extends StateNotifier<ProductState> {
  ProductProvider() : super(ProductState(dataExists: false, productList: []));

  ProductDataSourceRepository productDataSourceRepository =
      ProductDataSourceRepository();

  List<Product> productList = [];

  Future<List<Product>> getProducts() async {
    try {
      productList = await productDataSourceRepository.getProducts("products");
      state = state.copyWith(productList: productList);
      return productList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        state = state.copyWith(productList: []);
      }
      rethrow;
    }
  }
}

final productProvider = StateNotifierProvider<ProductProvider, ProductState>(
    (ref) => ProductProvider()..getProducts());
