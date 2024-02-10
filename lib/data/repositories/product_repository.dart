import 'package:diwithriverpood/data/datasources/product_local_data_source.dart';
import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';

import '../models/product_model.dart';
abstract class IProductRepository{
  Future<List<Product>> getProducts();
}
class ProductDataSourceRepository extends IProductRepository{
  final ProductLocalDataSource _productLocalDataSource =
      ProductLocalDataSource();
  final ProductRemoteDataSource _productRemoteDataSource =
      ProductRemoteDataSource();
  @override
  Future<List<Product>> getProducts() async {
    List<Product> products = await _productLocalDataSource.getProducts();
    if (products.isEmpty) {
      products = await _productRemoteDataSource.getProducts();
      _productLocalDataSource.addItems(products);
    }
    return products;
  }
}
