import 'package:diwithriverpood/data/datasources/product_remote_data_source.dart';

import '../../data/models/product_model.dart';

abstract class IProductRemoteSourceRepository {

  Future<List<Product>> getProducts(
      {required String subUrl, Map<String, String>? filterHeaders});
}

class ProductRemoteDataSourceRepository extends IProductRemoteSourceRepository {
  final ProductRemoteDataSource _productDataSource=ProductRemoteDataSource();
  @override
  Future<List<Product>> getProducts(
      {required String subUrl, Map<String, String>? filterHeaders}) async{
    final products = await _productDataSource.getProducts(subUrl: subUrl);
    return products;
  }
}
