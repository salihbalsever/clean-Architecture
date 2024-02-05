import 'package:diwithriverpood/data/datasources/product_local_data_source.dart';
import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';
import 'package:diwithriverpood/domain/repositories/product_local_source_repository.dart';
import 'package:diwithriverpood/domain/repositories/product_remote_source_repository.dart';
import 'package:diwithriverpood/presentation/provider/product_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product_model.dart';

class ProductProvider extends StateNotifier<ProductState> {
  ProductProvider() : super(ProductState(dataExists: false, productList: []));


  final ProductRemoteDataSourceRepository _productRemoteDataSourceRepository= ProductRemoteDataSourceRepository();
  final ProductLocalDataSourceRepository _productLocalDataSourceRepository = ProductLocalDataSourceRepository();
  List<Product> productList = [];

  Future<bool> checkDataExists() async {
    List<Product> products = await _productLocalDataSourceRepository.getProducts();
    state =
        state.copyWith(dataExists: products.isNotEmpty, productList: products);
    if (products.isEmpty) {
      getProducts();
    }
    return products.isEmpty;
  }

  Future<List<Product>> getProducts() async {
    try {
      productList = await _productRemoteDataSourceRepository.getProducts(subUrl: "products");
      state = state.copyWith(productList: productList);
      saveDatabase();
      return productList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        state = state.copyWith(productList: []);
      }
      rethrow;
    }
  }

  Future<void> saveDatabase() async {
    await _productLocalDataSourceRepository.addItem(state.productList);
  }
}

final productProvider = StateNotifierProvider<ProductProvider, ProductState>(
    (ref) => ProductProvider()..checkDataExists());
