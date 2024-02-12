import 'package:diwithriverpood/data/datasources/product_local_data_source.dart';
import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../models/product_model.dart';
abstract class IProductRepository{
  Future<List<Product>> getProducts();
}
class ProductRepository extends IProductRepository{
  @override
  Future<List<Product>> getProducts() async {
    final productLocalDataSource = getIt<IProductLocalDataSource>();
    final productRemoteDataSource = getIt<IProductRemoteDataSource>();


    List<Product> products = await productLocalDataSource.getProducts();
    if (products.isEmpty) {
      products = await productRemoteDataSource.getProducts();
      productLocalDataSource.addItems(products);
    }
    return products;
  }
}
