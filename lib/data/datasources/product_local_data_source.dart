import 'package:diwithriverpood/data/models/product_model.dart';
import 'package:hive/hive.dart';

abstract class IProductLocalDataSource<Product> {

  Future<Box> openBox();

  Future<void> closeBox(Box<Product> box);

  Future<void> addItem(List<Product> products);

  Future<List<Product>> getProducts();

}

class ProductLocalDataSource extends IProductLocalDataSource<Product>{
  static const key= "products";
  @override
  Future<void> addItem(List<Product> products) async {
    try{
      final box = await openBox();
      box.put(key, products);
      await closeBox(box);
    }catch(e){
      print('Error: $e');
    }
  }


  @override
  Future<void> closeBox(Box box) async{
    await box.close();
  }

  @override
  Future<List<Product>> getProducts() async {
    final box = await openBox();
    List<dynamic> rawProducts = box.get(key, defaultValue: []);
    List<Product> products = List<Product>.from(rawProducts);
    await closeBox(box);
    return products.isNotEmpty ? products : [];
  }


  @override
  Future<Box> openBox() async {
    return await Hive.openBox("product");
  }
}