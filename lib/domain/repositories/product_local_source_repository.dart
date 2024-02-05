
import 'package:hive/hive.dart';

import '../../data/datasources/product_local_data_source.dart';
import '../../data/models/product_model.dart';

abstract class IProductLocalDataSourceRepository {
  Future<Box> openBox();

  Future<void> closeBox(Box<Product> box);

  Future<void> addItem(List<Product> products);

  Future<List<Product>> getProducts();
}

class ProductLocalDataSourceRepository extends IProductLocalDataSourceRepository {
   final ProductLocalDataSource _productLocalDataSource = ProductLocalDataSource();

  @override
  Future<void> addItem(List<Product> products) async {
   await _productLocalDataSource.addItem(products);
  }

  @override
  Future<void> closeBox(box) async {
  await _productLocalDataSource.closeBox(box);
  }

  @override
  Future<List<Product>> getProducts() {
   final products = _productLocalDataSource.getProducts();
   return products;
  }

  @override
  Future<Box> openBox() async{
  return  await _productLocalDataSource.openBox();
  }

}
