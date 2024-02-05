import 'package:diwithriverpood/data/datasources/product_local_data_source.dart';
import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';

import '../models/product_model.dart';

class ProductDataSourceRepository {
  final ProductLocalDataSource _productLocalDataSource =
      ProductLocalDataSource();
  final ProductRemoteDataSource _productRemoteDataSource =
      ProductRemoteDataSource();

  Future<List<Product>> getProducts(String subUrl) async {
    List<Product> products = await _productLocalDataSource.getProducts();
    if (products.isEmpty) {
      products = await _productRemoteDataSource.getProducts(subUrl: subUrl);
      _productLocalDataSource.addItem(products);
    }
    return products;
  }
}
